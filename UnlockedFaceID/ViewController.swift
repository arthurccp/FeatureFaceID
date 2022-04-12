
//
//  ViewController.swift
//  UnlockedFaceID
//
//  Created by Arthur Silva on 11/04/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var loginBtnoutlet: UIButton!
    @IBOutlet weak var SwitchOutlet: UISwitch!
    
    
    var validateFaceID: Bool = false
    var context = LAContext()
    var erro:  NSError?
    
    override func viewDidLoad () {
        super.viewDidLoad ()
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        if SwitchOutlet.isOn{
            validateFaceID = true
        }
        else{
            validateFaceID = false
        }
    }
    
    @IBAction func loginButtonAct(_ sender: UIButton) {
        if validateFaceID == true {
            changeValidation()
            
        }else{
            if validateFaceID == false{
            }
        }

    }
    
    func changeValidation() {
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


//
//class SecurityManager {
//
//
//    static func autenticate() {
//
//    }
//
//
//}
