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
    @IBOutlet var logInView: LogInView!
    
    //MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if logInModel.isValid(login: logInView.loginTextField.text ?? "", password: logInView.passwordTextField.text ?? "") {
            performSegue(withIdentifier: "enter", sender: nil)
        } else {
            logInView.promptLabel.isHidden = false
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        logInView.promptLabel.isHidden = true
    }
}
