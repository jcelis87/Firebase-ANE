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
import FreSwift
import FirebaseMLVision

public extension VisionBarcodeAddress {
    func toFREObject() -> FREObject? {
        guard let ret = FreObjectSwift(className: "com.tuarua.firebase.ml.vision.barcode.BarcodeAddress")
            else { return nil }
        ret["type"] = type.rawValue.toFREObject()
        ret["addressLines"] = self.addressLines?.toFREObject()
        return ret.rawValue
    }
}

public extension Array where Element == VisionBarcodeAddress {
    func toFREObject() -> FREObject? {
        guard let ret = FREArray(className: "com.tuarua.firebase.ml.vision.barcode.BarcodeAddress") else { return nil }
        for element in self {
            ret.push(element.toFREObject())
        }
        return ret.rawValue
    }
}

public extension FreObjectSwift {
    subscript(dynamicMember name: String) -> [VisionBarcodeAddress]? {
        get { return nil }
        set { rawValue?[name] = newValue?.toFREObject() }
    }
}
