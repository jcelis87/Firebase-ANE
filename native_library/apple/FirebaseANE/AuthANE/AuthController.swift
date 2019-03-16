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
import Firebase
import FirebaseAuth

class AuthController: FreSwiftController {
    static var TAG = "AuthController"
    internal var context: FreContextSwift!
    private var auth: Auth?
    convenience init(context: FreContextSwift) {
        self.init()
        self.context = context
        guard let app = FirebaseApp.app() else {
            warning(">>>>>>>>>> NO FirebaseApp !!!!!!!!!!!!!!!!!!!!!")
            return
        }
        auth = Auth.auth(app: app)
    }
    
    func createUser(email: String, password: String, eventId: String?) {
        auth?.createUser(withEmail: email, password: password) { (_, error) in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.USER_CREATED,
                               value: AuthEvent(eventId: eventId, data: nil, error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.USER_CREATED,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        }
    }
    
    func signIn(credential: AuthCredential, eventId: String?) {
        auth?.signInAndRetrieveData(with: credential, completion: { (_, error) in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId, data: nil, error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        })
    }
    
    func signInAnonymously(eventId: String?) {
        auth?.signInAnonymously { _, error in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId, data: nil,
                                                error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        }
    }
    
    func signInWithCustomToken(token: String, eventId: String?) {
        auth?.signIn(withCustomToken: token, completion: { (_, error) in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId, data: nil,
                                                error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.SIGN_IN,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        })
    }
    
    func signOut() {
        do {
            try auth?.signOut()
        } catch {
            
        }
    }
    
    func sendPasswordReset(email: String, eventId: String?) {
        auth?.sendPasswordReset(withEmail: email) { error in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.PASSWORD_RESET_EMAIL_SENT,
                               value: AuthEvent(eventId: eventId, data: nil,
                                                error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.PASSWORD_RESET_EMAIL_SENT,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        }
    }
    
    func reauthenticate(email: String, password: String, eventId: String?) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        let user = Auth.auth().currentUser
        user?.reauthenticateAndRetrieveData(with: credential, completion: { (_, error) in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.USER_REAUTHENTICATED,
                               value: AuthEvent(eventId: eventId, data: nil,
                                                error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.USER_REAUTHENTICATED,
                               value: AuthEvent(eventId: eventId).toJSONString())
            }
        })
    }
    
    func verifyPhoneNumber(phoneNumber: String, eventId: String?) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationId, error) in
            if eventId == nil { return }
            if let err = error as NSError? {
                self.dispatchEvent(name: AuthEvent.PHONE_CODE_SENT,
                               value: AuthEvent(eventId: eventId, data: nil,
                                                error: err).toJSONString())
            } else {
                self.dispatchEvent(name: AuthEvent.PHONE_CODE_SENT,
                               value: AuthEvent(eventId: eventId,
                                                data: ["verificationId": verificationId ?? ""]).toJSONString())
            }
        }
    }
    
    func setLanguage(code: String) {
        auth?.languageCode = code
    }
    
    func getLanguage() -> String? {
        return auth?.languageCode
    }
    
}
