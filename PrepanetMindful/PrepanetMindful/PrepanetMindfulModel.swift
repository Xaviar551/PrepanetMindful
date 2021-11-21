//
//  PrepanetMindfulModel.swift
//  PrepanetMindful
//
//  Created by user197920 on 11/2/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PrepanetMindfulModel: NSObject {
    private static var uid: String = ""
    
    override init() {
    }
    func getUid() ->String {
        return PrepanetMindfulModel.uid
    }
    
    func iniciarSesion(usuario: String, contrasena: String, _ callbackFunction:@escaping (() ->  Void), _ errorCallback:@escaping (()->Void) = {}) {
        Auth.auth().signIn(withEmail: usuario, password: contrasena, completion: { (authResult, error) ->  Void in
            guard let auth = authResult else{
                PrepanetMindfulModel.uid="error"
                return
            }
            PrepanetMindfulModel.uid=auth.user.uid
            callbackFunction()
        })
    }
}

