//
//  SignInViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit
import SafariServices

final class SignInViewController: UIViewController {
    
    // MARK: - Variables
    
    private let url = URL(string: "https://support.google.com/accounts/answer/2917834?visit_id=638236483447866119-3400749500&p=signin_privatebrowsing&hl=en&rd=1")
    
    // MARK: - UI Components
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // MARK: - Actions
    
    @IBAction func learnMoreAction(_ sender: Any) {
        guard let url = url else { return }
        let svc = SFSafariViewController(url: url)
        present(svc, animated: true, completion: nil)
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Registration", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpViewControllerID") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        performSegue(withIdentifier: "mainSegueID", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainSegueID" {
            if let _ = segue.destination as? GmailTabBarController {
                //TODO: Aren
            }
        }
    }
}
