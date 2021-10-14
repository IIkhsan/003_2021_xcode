//
//  EnterViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Properties
    var logInModel = LogInModel()
    
    //MARK: IBOutlets
    @IBOutlet weak var logInView: LogInView!
    
    //MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        let isLoginValid = logInModel.validateLogin(login: logInView.loginTextField.text ?? "")
        logInView.handleLoginValidation(isValid: isLoginValid)
        let passwordValidationResult = logInModel.validatePassword(password: logInView.passwordTextField.text ?? "")
        logInView.handlePasswordValidation(result: passwordValidationResult)
        if isLoginValid && passwordValidationResult.isValid {
            performSegue(withIdentifier: "enter", sender: nil)
        } else {
            logInView.showAlert(isLoginValid: isLoginValid, passwordValidationResult: passwordValidationResult)
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
