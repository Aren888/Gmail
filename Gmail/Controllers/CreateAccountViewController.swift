//
//  CreateAccountViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - UI Components
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction
    
    @IBAction func alreadyHaveAccountAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        print("Sign Up Action")
    }

    // MARK: - UI Setup
    
    // MARK: - Selectors
    
}
