/*
 * Copyright 2019 Tua Rua Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.tuarua.firebase.ml.scanner

import com.google.android.gms.tasks.Task
import com.google.firebase.ml.vision.common.FirebaseVisionImage
import com.google.firebase.ml.vision.common.FirebaseVisionImageMetadata
import java.nio.ByteBuffer
import java.util.concurrent.atomic.AtomicBoolean

abstract class BaseVisionProcessor<T>: VisionImageProcessor {

    private val shouldThrottle = AtomicBoolean(false)

    override fun process(data: ByteBuffer, frameMetadata: FrameMetadata) {
        if (shouldThrottle.get()) {
            return
        }

        detectInVisionImage(FirebaseVisionImage.fromByteBuffer(data, buildFirebaseVisionMetadata(frameMetadata)),
                frameMetadata)
    }

    override fun process(byteArray: ByteArray, frameMetadata: FrameMetadata) {
        if (shouldThrottle.get()) {
            return
        }

        detectInVisionImage(FirebaseVisionImage.fromByteArray(byteArray, buildFirebaseVisionMetadata(frameMetadata)),
                frameMetadata)
    }

    private fun buildFirebaseVisionMetadata(frameMetadata: FrameMetadata): FirebaseVisionImageMetadata {
        return FirebaseVisionImageMetadata.Builder()
                .setFormat(FirebaseVisionImageMetadata.IMAGE_FORMAT_NV21)
                .setWidth(frameMetadata.width)
                .setHeight(frameMetadata.height)
                .setRotation(frameMetadata.rotation)
                .build()
    }

    override fun stop() {
    }

    private fun detectInVisionImage(image: FirebaseVisionImage, metadata: FrameMetadata) {
        detectInImage(image).addOnSuccessListener {
            shouldThrottle.set(false)
            onDetectionSucceed(it, metadata)
        }.addOnFailureListener {
            shouldThrottle.set(false)
            onDetectionFailed(it)
        }
        // Start throttle until this frame of input has been processed.
        shouldThrottle.set(true)
    }

    protected abstract fun detectInImage(image: FirebaseVisionImage): Task<T>
    protected abstract fun onDetectionSucceed(result: T, frameMetadata: FrameMetadata)
    protected abstract fun onDetectionFailed(exception: Exception)
}