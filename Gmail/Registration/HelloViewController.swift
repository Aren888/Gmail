//
//  HelloViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

class HelloViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func signInAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let addAccountViewController = storyboard.instantiateViewController(withIdentifier: "AddAccountViewControllerID") as? AddAccountViewController {
            present(addAccountViewController, animated: true, completion: nil)
        }
    }
    
    
}
