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

package com.tuarua.firebase.naturallanguage.events

data class LanguageEvent(val eventId: String, val error: Map<String, Any>? = null) {
    companion object {
        const val RECOGNIZED = "LanguageEvent.Recognized"
        const val RECOGNIZED_MULTI = "LanguageEvent.RecognizedMulti"
    }
}