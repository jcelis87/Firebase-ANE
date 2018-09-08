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
public final class CloudDetectedBreakType {
    /**
     * Unknown break type.
     */
    public static const unknown:int = 0;
    /**
     * Line-wrapping break type.
     */
    public static const lineWrap:int = 1;
    /**
     * Hyphen break type.
     */
    public static const hyphen:int = 2;
    /**
     * Line break that ends a paragraph.
     */
    public static const lineBreak:int = 3;
    /**
     * Space break type.
     */
    public static const space:int = 4;
    /**
     * Sure space break type.
     */
    public static const sureSpace:int = 5;

}
}
