//
//  ViewController.swift
//  ToonSnaps
//
//  Created by Jefferey Rigler on 11/27/16.
//  Copyright © 2016 RiglerDigital. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We Tried to Sign In")
            if error != nil {
                print("We have an error:\(error)")
            }
        })
        
        
    }
    
    
}

