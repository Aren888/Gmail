//
//  HelloViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

final class HelloViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        let addAccountVC = storyboard?.instantiateViewController(withIdentifier: "AddAccountViewControllerID") as! AddAccountViewController
        navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(addAccountVC, animated: true)
    }
}
