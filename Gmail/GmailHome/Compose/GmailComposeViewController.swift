//
//  GmailComposeViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

class GmailComposeViewController: UIViewController {
    
    
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var composeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    private func setupUI() {
        // Configure text fields
        toTextField.borderStyle = .roundedRect
        toTextField.layer.cornerRadius = 12
        toTextField.layer.masksToBounds = true
        
        toTextField.layer.shadowColor = UIColor.black.cgColor
        toTextField.layer.shadowOpacity = 0.2
        toTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        toTextField.layer.shadowRadius = 4
        
        fromTextField.borderStyle = .roundedRect
        fromTextField.layer.cornerRadius = 12
        fromTextField.layer.masksToBounds = true
        
        subjectTextField.borderStyle = .roundedRect
        subjectTextField.layer.cornerRadius = 12
        subjectTextField.layer.masksToBounds = true
        // Configure compose text view
        composeTextView.font = UIFont.systemFont(ofSize: 16)
        composeTextView.layer.cornerRadius = 8
        composeTextView.layer.borderWidth = 1
        composeTextView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choosefilesAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Files", message: "Select the files you want to attach.", preferredStyle: .alert)
          
          // Add actions
          alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          alertController.addAction(UIAlertAction(title: "Attach", style: .default, handler: { _ in
              // Handle attach action
              // Add your logic here to handle the attachment of files
          }))
          
          // Present the alert
          present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func sendAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Send Email", message: "Are you sure you want to send this email?", preferredStyle: .alert)
            
            // Add actions
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "Send", style: .default, handler: { _ in
                self.sendEmail()
            }))
            
            // Present the alert
            present(alertController, animated: true, completion: nil)
    }
    
    private func sendEmail() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Settings", message: "Configure your app settings.", preferredStyle: .alert)
           
           // Add actions
           alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
               // Handle save action
               // Add your logic here to handle the saving of settings
           }))
           
           // Present the alert
           present(alertController, animated: true, completion: nil)
    }
    
}
