//
//  LogInView.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class LogInView: UIView {
    
    //MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordValidationErrorLabel: UILabel!
    @IBOutlet weak var loginValidationErrorLabel: UILabel!
    
    //MARK: - Public functions
    func handleLoginValidation (isValid: Bool) {
        if isValid {
            loginValidationErrorLabel.text = " "
        } else {
            loginValidationErrorLabel.text = "Invalid email"
        }
    }
    
    func handlePasswordValidation (result: (isValid: Bool, errorMsg: String?)) {
        if result.isValid {
            passwordValidationErrorLabel.text = " "
        } else {
            passwordValidationErrorLabel.text = result.errorMsg
        }
    }
    
    func showAlert(isLoginValid: Bool, passwordValidationResult: (isValid: Bool,errorMsg: String?)) {
        var alertTitle = ""
        var alertDesc: String?
        if !isLoginValid {
            alertTitle.append("Invalid email")
            if !passwordValidationResult.isValid {
                alertTitle.append(", ")
            }
        }
        if !passwordValidationResult.isValid {
            alertTitle.append("Wrong password")
            alertDesc = passwordValidationResult.errorMsg
        }
        let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
