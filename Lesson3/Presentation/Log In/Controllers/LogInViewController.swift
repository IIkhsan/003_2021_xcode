//
//  EnterViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var logInView: LogInView!
    
    //MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if logInView.loginTextField.text == "admin" && logInView.passwordTextField.text == "admin" {
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
