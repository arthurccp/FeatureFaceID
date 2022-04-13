//
//  ViewController.swift
//  UnlockedFaceID
//
//  Created by Arthur Silva on 13/04/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController{
    
    @IBOutlet weak var loginBtnoutlet: UIButton!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    var validateFaceID: Bool = false

    override func viewDidLoad () {
        super.viewDidLoad ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        SecurityManager.authenticate(callback: { status in
//            self.validateFaceID = status
//        })
    }
    
    @IBAction func SwitchAction(_ sender: UISwitch) {
        SecurityManager.shared.needsAuthentication = switchOutlet.isOn
    }
    
    @IBAction func loginButtonAct(_ sender: UIButton) {
        if validateFaceID == true {
          
        }
    }
    

    
}
