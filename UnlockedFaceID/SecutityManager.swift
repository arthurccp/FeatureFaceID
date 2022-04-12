//
//  SecutityManager.swift
//  UnlockedFaceID
//
//  Created by Arthur Silva on 12/04/22.
//

import Foundation
import LocalAuthentication

class secutiryManager: ViewController{
    
    
    func authenticate(){
        if loginBtnoutlet.titleLabel?.text == "Login" {
            context = LAContext()
            var error : NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                let reason = "Login into the application"
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
                    if self.context.biometryType == .faceID {
                        print("face id biometrics")
                    }
                    else if self.context.biometryType == .touchID {
                        print("touch id biometrics")
                    }
                    else {
                        print("No Biometrics")
                    }
                    
                    if success{
                        DispatchQueue.main.async {
                            self.loginBtnoutlet.setTitle("Logout", for: .normal)
                        }
                    } else {
                        print("ERROR : \(error?.localizedDescription ?? "")")
                    }
                }
            } else {
                print ("Error found \(error?.localizedDescription ?? "NOTHING FOUND")")
            }
        } else {
            DispatchQueue.main.async {
                self.loginBtnoutlet.setTitle("Login", for: .normal)
            }
        }
        
    }
}
