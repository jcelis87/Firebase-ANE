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

package com.tuarua.firebase.ml.custom {
/** Options for a custom model specifying input and output data types and dimensions. */
public class ModelInterpreterOptions {
    private var _localModel:CustomLocalModel;
    private var _remoteModel:CustomRemoteModel;

    public function ModelInterpreterOptions(localModel:CustomLocalModel = null, remoteModel:CustomRemoteModel = null) {
        this._localModel = localModel;
        this._remoteModel = remoteModel;
    }

    public function get localModel():CustomLocalModel {
        return _localModel;
    }

    public function get remoteModel():CustomRemoteModel {
        return _remoteModel;
    }
}
}
