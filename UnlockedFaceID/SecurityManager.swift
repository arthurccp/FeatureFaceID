//
//  SecurityManager.swift
//  UnlockedFaceID
//
//  Created by Arthur Silva on 13/04/22.
//

import Foundation
import UIKit
import LocalAuthentication

class SecurityManager {
    
    let context = LAContext()
    var error : NSError?
    var needsAuthentication = false
    
    static let shared = SecurityManager()
    
    func authenticate() {
        if !needsAuthentication { return }
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Login into the application"
            return context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in                
                if success {
                    self.needsAuthentication = false
                    return print("sucess")
                } else {
                    self.needsAuthentication = true
                    
                    
    
                    return print("failed")
    
                }
            }
        } else {
           

            print ("Error found \(error?.localizedDescription ?? "NOTHING FOUND")")
        }

    }
    
}
