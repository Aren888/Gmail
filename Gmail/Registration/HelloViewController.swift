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
        
        let addAccountVC = storyboard?.instantiateViewController(withIdentifier: "AddAccountViewControllerID") as! AddAccountViewController
        let navigationController = UINavigationController(rootViewController: addAccountVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
