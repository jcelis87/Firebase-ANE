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

package com.tuarua.firebase.ml.naturallanguage.extensions

import com.adobe.fre.FREObject
import com.google.firebase.ml.naturallanguage.languageid.FirebaseLanguageIdentificationOptions
import com.tuarua.frekotlin.Float
import com.tuarua.frekotlin.get

@Suppress("FunctionName")
fun FirebaseLanguageIdentificationOptions(freObject: FREObject?): FirebaseLanguageIdentificationOptions? {
    val rv = freObject ?: return null
    val confidenceThreshold = Float(rv["confidenceThreshold"]) ?: 0.5f
    return FirebaseLanguageIdentificationOptions.Builder()
            .setConfidenceThreshold(confidenceThreshold)
            .build()
}