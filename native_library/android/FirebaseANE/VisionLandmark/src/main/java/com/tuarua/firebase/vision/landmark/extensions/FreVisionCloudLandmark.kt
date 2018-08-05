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

package com.tuarua.firebase.vision.landmark.extensions

import com.adobe.fre.FREArray
import com.adobe.fre.FREObject
import com.google.firebase.ml.vision.cloud.landmark.FirebaseVisionCloudLandmark
import com.tuarua.firebase.vision.extensions.FREArray
import com.tuarua.firebase.vision.extensions.toFREObject
import com.tuarua.frekotlin.*

fun FirebaseVisionCloudLandmark.toFREObject(): FREObject? {
    try {
        val ret = FREObject("com.tuarua.firebase.vision.CloudLandmark")
        ret["confidence"] = confidence.toFREObject()
        ret["landmark"] = landmark.toFREObject()
        ret["entityId"] = entityId.toFREObject()
        ret["frame"] = boundingBox.toFREObject()

        ret["locations"] = FREArray(this.locations)

        return ret
    } catch (e: FreException) {

    }
    return null
}

fun FREArray(value: List<FirebaseVisionCloudLandmark>): FREArray {
    val ret = FREArray("com.tuarua.firebase.vision.CloudLandmark", value.size, true)
    for (i in value.indices) {
        ret[i] = value[i].toFREObject()
    }
    return ret
}