//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    self.errorMessage.text = e.localizedDescription
                } else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    self.errorMessage.text = ""
                    
                }
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == emailTextfield) {
           textField.text = ""
        }
        else if (textField == passwordTextfield) {
            textField.text = ""
        }
    }
    
    
}
