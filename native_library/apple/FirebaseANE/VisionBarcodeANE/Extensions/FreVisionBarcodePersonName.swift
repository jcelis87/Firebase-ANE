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

public extension VisionBarcodePersonName {
    func toFREObject() -> FREObject? {
        do {
            let ret = try FREObject(className: "com.tuarua.firebase.vision.BarcodePersonName")
            try ret?.setProp(name: "formattedName", value: self.formattedName)
            try ret?.setProp(name: "first", value: self.first)
            try ret?.setProp(name: "last", value: self.last)
            try ret?.setProp(name: "middle", value: self.middle)
            try ret?.setProp(name: "prefix", value: self.prefix)
            try ret?.setProp(name: "pronounciation", value: self.pronounciation)
            try ret?.setProp(name: "suffix", value: self.suffix)
            return ret
        } catch {
        }
        return nil
    }
}
