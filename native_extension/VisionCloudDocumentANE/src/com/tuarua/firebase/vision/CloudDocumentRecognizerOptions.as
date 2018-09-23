/*
 * Copyright 2018 Tua Rua Ltd.
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

package com.tuarua.firebase.vision {
/**
 * Options for a cloud document text recognizer.
 */
public class CloudDocumentRecognizerOptions {
    /**
     * API key to use for Cloud Vision API.  If `null`, the default API key from FirebaseApp will be
     * used.
     */
    public var apiKeyOverride:String;
    /**
     * An array of hinted language codes for cloud document text recognition. The default is `nil`. See
     * https://cloud.google.com/vision/docs/languages for supported language codes.
     */
    public var languageHints:Vector.<String> = new Vector.<String>();
    public function CloudDocumentRecognizerOptions() {
    }
}
}
