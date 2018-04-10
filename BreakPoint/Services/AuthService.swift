//
//  AuthService.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation
import Firebase

class AuthSerivce {
    static let instance = AuthSerivce()
    
    func registerUser(withEmail email : String , andPassword password : String , completion : @escaping CompletionHandler ){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                completion(false , error)
                return
            }
            
            let userData = [
                "provider" : user.providerID,
                "email" : user.email
            ]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            completion(true,nil)
        }
    }
    
    func loginUser(withEmail email : String , andPassword password : String , completion : @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                completion(false, error)
                return
            }
            completion(true,nil)
        }
    }
}
