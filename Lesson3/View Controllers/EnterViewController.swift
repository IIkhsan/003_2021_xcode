//
//  EnterViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 06.10.2021.
//

import UIKit

class EnterViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var promptLabel: UILabel!
    
    //MARK: IBActions
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if loginTextField.text == "admin" && passwordTextField.text == "admin" {
            performSegue(withIdentifier: "enter", sender: nil)
        } else {
            promptLabel.isHidden = false
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        promptLabel.isHidden = true
    }
}
