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

package com.tuarua.firebase.vision {
[RemoteClass(alias="com.tuarua.firebase.vision.BarcodeDriverLicense")]
public class BarcodeDriverLicense {
    public var expiryDate:String;
    public var firstName:String;
    public var gender:String;
    public var issuingCountry:String;
    public var issuingDate:String;
    public var lastName:String;
    public var licenseNumber:String;
    public var middleName:String;

    public function BarcodeDriverLicense() {
    }
}
}