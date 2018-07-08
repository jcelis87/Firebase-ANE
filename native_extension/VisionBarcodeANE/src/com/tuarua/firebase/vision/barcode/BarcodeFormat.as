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

package com.tuarua.firebase.vision.barcode {
public final class BarcodeFormat {
    /** Unknown format. */
    public static const unknown:int = 0;
    /** All format.*/
    public static const all:int = 0xFFFF;
    /** Code-128 detection.*/
    public static const code128:int = 0x0001;
    /** Code-39 detection.*/
    public static const code39:int = 0x0002;
    /** Code-93 detection.*/
    public static const code93:int = 0x0004;
    /** Codabar detection.*/
    public static const codaBar:int = 0x0008;
    /** Data Matrix detection.*/
    public static const dataMatrix:int = 0x0010;
    /** EAN-13 detection.*/
    public static const EAN13:int = 0x0020;
    /** EAN-8 detection.*/
    public static const EAN8:int = 0x0040;
    /** ITF detection.*/
    public static const ITF:int = 0x0080;
    /** QR Code detection.*/
    public static const qrCode:int = 0x0100;
    /** UPC-A detection.*/
    public static const UPCA:int = 0x0200;
    /** UPC-E detection.*/
    public static const UPCE:int = 0x0400;
    /** PDF-417 detection.*/
    public static const PDF417:int = 0x0800;
    /** Aztec code detection.*/
    public static const aztec:int = 0x1000;

    public static function toString(value:int):String {
        switch (value) {
            case 0:
                return "unknown";
            case 0xFFFF:
                return "all";
            case 0x0001:
                return "code128";
            case 0x0002:
                return "code39";
            case 0x0004:
                return "code93";
            case 0x0008:
                return "codaBar";
            case 0x0002:
                return "dataMatrix";
            case 0x0020:
                return "EAN13";
            case 0x0040:
                return "EAN8";
            case 0x0080:
                return "ITF";
            case 0x0100:
                return "qrCode";
            case 0x0200:
                return "UPCA";
            case 0x0400:
                return "UPCE";
            case 0x0800:
                return "PDF417";
            case 0x1000:
                return "aztec";
            default:
                return "unknown";
        }
    }

}
}