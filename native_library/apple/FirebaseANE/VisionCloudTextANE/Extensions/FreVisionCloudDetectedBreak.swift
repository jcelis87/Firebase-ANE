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

public extension VisionCloudDetectedBreak {
    func toFREObject() -> FREObject? {
        guard let fre = try? FREObject(className: "com.tuarua.firebase.vision.CloudDetectedBreak"),
            var ret = fre
            else { return nil }
        ret["isPrefix"] = (self.isPrefix == 1.0).toFREObject()
        ret["type"] = self.type.rawValue.toFREObject()
        return ret
    }
}