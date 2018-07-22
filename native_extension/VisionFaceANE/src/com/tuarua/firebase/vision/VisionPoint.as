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
[RemoteClass(alias="com.tuarua.firebase.vision.VisionPoint")]
public class VisionPoint {
    private var _x:Number;
    private var _y:Number;
    private var _z:Number;
    public function VisionPoint(x:Number, y:Number, z:Number) {
        this._x = x;
        this._y = y;
        this._z = z;
    }

    public function get x():Number {
        return _x;
    }

    public function get y():Number {
        return _y;
    }

    public function get z():Number {
        return _z;
    }
}
}
