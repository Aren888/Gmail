//
//  SignUpViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class SignUpViewController: UIViewController {
    
    // MARK: - UI Components
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    // MARK: - @IBAction
    
    @IBAction func alreadyHaveAccountAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
