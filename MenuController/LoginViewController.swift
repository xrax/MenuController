//
//  LoginViewController.swift
//  MenuController
//
//  Created by Leonardo Armero Barbosa on 11/6/17.
//  Copyright © 2017 com.lab.empresariales.app.empresarialesios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLoginClick() {
//        if tfEmail.text == "Some" && tfPassword.text == "Body" {
            let hostVC = storyboard!.instantiateViewController(withIdentifier: "HostViewController")
            navigationController!.pushViewController(hostVC, animated: true)
//        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            tfEmail.resignFirstResponder()
            tfPassword.becomeFirstResponder()
        } else if textField == tfPassword {
            view.endEditing(true)
        }
        return true
    }
}
