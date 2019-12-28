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

public extension Array where Element == NSValue {
    func toFREObject() -> FREObject? {
        return FREArray(className: "flash.geom.Point",
                                      length: self.count,
                                      fixed: true,
                                      items: self.compactMap { $0.cgPointValue.toFREObject() }
            )?.rawValue
    }
}
public extension FreObjectSwift {
    subscript(dynamicMember name: String) -> [NSValue]? {
        get { return nil }
        set { rawValue?[name] = newValue?.toFREObject() }
    }
}
