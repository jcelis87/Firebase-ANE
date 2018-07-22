/*
 *  Copyright 2018 Tua Rua Ltd.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import Foundation
import FirebaseMLVision
import FreSwift
import AVFoundation
import SwiftyJSON
import Accelerate

extension SwiftController: AVCaptureVideoDataOutputSampleBufferDelegate {
    public func captureOutput(_ output: AVCaptureOutput,
                              didOutput sampleBuffer: CMSampleBuffer,
                              from connection: AVCaptureConnection) {
        
        guard let eventId = cameraEventId,
            let options = self.options else { return }
        
        let visionImage = VisionImage(buffer: sampleBuffer)
        let metadata = VisionImageMetadata()
        let orientation = UIUtilities.imageOrientation(
            //fromDevicePosition: isUsingFrontCamera ? .front : .back
            fromDevicePosition: .back
        )
        let visionOrientation = UIUtilities.visionImageOrientation(from: orientation)
        metadata.orientation = visionOrientation
        visionImage.metadata = metadata
        let barcodeDetector = vision.barcodeDetector(options: options)
        barcodeDetector.detect(in: visionImage) { (features, error) in
            if let err = error as NSError? {
                self.dispatchEvent(name: BarcodeEvent.DETECTED,
                               value: BarcodeEvent(eventId: eventId,
                                                   error: ["text": err.localizedDescription,
                                                           "id": err.code],
                                                   continuous: true).toJSONString())
            } else {
                if let features = features, !features.isEmpty {
                    self.results[eventId] = features
                    self.dispatchEvent(name: BarcodeEvent.DETECTED,
                                   value: BarcodeEvent(eventId: eventId,
                                                       continuous: true).toJSONString())
                }
            }
        }
    }
    
    /**
     First crops the pixel buffer, then resizes it.
     */
    private func resizePixelBuffer(_ srcPixelBuffer: CVPixelBuffer,
                                   cropX: Int, cropY: Int, cropWidth: Int, cropHeight: Int,
                                   scaleWidth: Int, scaleHeight: Int) -> CVPixelBuffer? {
        
        CVPixelBufferLockBaseAddress(srcPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        guard let srcData = CVPixelBufferGetBaseAddress(srcPixelBuffer) else {
            return nil
        }
        let srcBytesPerRow = CVPixelBufferGetBytesPerRow(srcPixelBuffer)
        let offset = cropY*srcBytesPerRow + cropX*4
        var srcBuffer = vImage_Buffer(data: srcData.advanced(by: offset),
                                      height: vImagePixelCount(cropHeight),
                                      width: vImagePixelCount(cropWidth),
                                      rowBytes: srcBytesPerRow)
        
        let destBytesPerRow = scaleWidth*4
        guard let destData = malloc(scaleHeight*destBytesPerRow) else {
            return nil
        }
        var destBuffer = vImage_Buffer(data: destData,
                                       height: vImagePixelCount(scaleHeight),
                                       width: vImagePixelCount(scaleWidth),
                                       rowBytes: destBytesPerRow)
        
        let error = vImageScale_ARGB8888(&srcBuffer, &destBuffer, nil, vImage_Flags(0))
        CVPixelBufferUnlockBaseAddress(srcPixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        if error != kvImageNoError {
            free(destData)
            return nil
        }
        
        let releaseCallback: CVPixelBufferReleaseBytesCallback = { _, ptr in
            if let ptr = ptr {
                free(UnsafeMutableRawPointer(mutating: ptr))
            }
        }
        
        let pixelFormat = CVPixelBufferGetPixelFormatType(srcPixelBuffer)
        var dstPixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreateWithBytes(nil, scaleWidth, scaleHeight,
                                                  pixelFormat, destData,
                                                  destBytesPerRow, releaseCallback,
                                                  nil, nil, &dstPixelBuffer)
        if status != kCVReturnSuccess {
            free(destData)
            return nil
        }
        return dstPixelBuffer
    }
    
    private func captureDevice(forPosition position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        return AVCaptureDevice.default(for: .video) ?? nil
    }
    
    private func setUpCaptureSessionInput() {
        var props: [String: Any] = Dictionary()
        sessionQueue.async {
            guard let device = self.captureDevice(forPosition: .back) else { return }
            do {
                let currentInputs = self.captureSession.inputs
                for input in currentInputs {
                    self.captureSession.removeInput(input)
                }
                
                let input = try AVCaptureDeviceInput(device: device)
                guard self.captureSession.canAddInput(input) else { return }
                self.captureSession.addInput(input)
            } catch {
                props["error"] = "no capture device"
                self.trace("no capture device")
                // self.sendEvent(name: VisionEvent.ERROR, value: JSON(props).description)
            }
        }
    }
    
    private func setUpCaptureSessionOutput() {
        var props: [String: Any] = Dictionary()
        sessionQueue.async {
            self.captureSession.beginConfiguration()
            self.captureSession.sessionPreset = AVCaptureSession.Preset.high
            
            let output = AVCaptureVideoDataOutput()
            output.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as String): kCVPixelFormatType_32BGRA]
            let queue = DispatchQueue(label: "com.tuarua.firebase.vision.cameraQueue")
            let videoDataOutput = AVCaptureVideoDataOutput()
            videoDataOutput.setSampleBufferDelegate(self, queue: queue)

            guard self.captureSession.canAddOutput(videoDataOutput) else {
                props["error"] = "cannot add camera output"
                self.trace("cannot add camera output")
                // self.sendEvent(name: VisionEvent.ERROR, value: JSON(props).description)
                return
            }
            self.captureSession.addOutput(videoDataOutput)
            self.captureSession.commitConfiguration()
            self.captureSession.startRunning()
        }
    }
    
    private func setUpPreviewLayer(rootViewController: UIViewController, mask: CGImage?) {
        var props: [String: Any] = Dictionary()
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        guard let videoPreviewLayer = videoPreviewLayer,
            let cameraView = cameraView else {
                props["error"] = "cannot add camera input"
                self.trace("cannot add camera input")
                // self.sendEvent(name: VisionEvent.ERROR, value: JSON(props).description)
                return
        }
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.frame = cameraView.layer.bounds
        cameraView.layer.addSublayer(videoPreviewLayer)
        
        if let mask = mask {
            let newLayer = CALayer()
            newLayer.backgroundColor = UIColor.clear.cgColor
            newLayer.frame = CGRect.init(x: 0,
                                         y: 0,
                                         width: rootViewController.view.frame.width,
                                         height: rootViewController.view.frame.height)
            newLayer.contents = mask
            for sv in rootViewController.view.subviews {
                if sv.debugDescription.starts(with: "<CTStageView") && sv.layer is CAEAGLLayer {
                    sv.layer.mask = newLayer
                }
            }
            // insert under AIR subView
            rootViewController.view.insertSubview(cameraView, at: 0)
        } else {
            rootViewController.view.addSubview(cameraView)
        }
    }
    
    func inputFromCamera(rootViewController: UIViewController, eventId: String, mask: CGImage?) {
        cameraView = UIView(frame: CGRect(x: 0, y: 0, width: rootViewController.view.frame.width,
                                          height: rootViewController.view.frame.height))
        setUpCaptureSessionInput()
        setUpPreviewLayer(rootViewController: rootViewController, mask: mask)
        // setUpCaptureSessionOutput()
        
    }
    
    func closeCamera(rootViewController: UIViewController) {
        sessionQueue.async {
            self.captureSession.stopRunning()
        }
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        
        videoPreviewLayer?.removeFromSuperlayer()
        cameraView?.removeFromSuperview()
        
        videoPreviewLayer = nil
        cameraView = nil
        
        for sv in rootViewController.view.subviews {
            if sv.debugDescription.starts(with: "<CTStageView") && sv.layer is CAEAGLLayer {
                sv.layer.mask = nil
            }
        }
    }
    
}
