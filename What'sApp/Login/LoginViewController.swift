//
//  ViewController.swift
//  Regisreationform
//
//  Created by Abdo on 9/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    
    var loggedInUser : User!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let user  = UserRepository.canLogin(username: userNameTxtField.text!, password: passwordTxtField.text! ) {
            loggedInUser = user
            print("login Succefully")
            UserRepository.login(user: user)
            performSegue(withIdentifier: "loginSegueID", sender: self)
        }else {
            print("error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension LoginViewController : UITextFieldDelegate{
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
   
}

