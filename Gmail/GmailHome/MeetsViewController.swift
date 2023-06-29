//
//  MeetsViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class MeetsViewController: UIViewController {
    static let id = "MeetsViewControllerID"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func configVC() {
        self.title = "Meets"
        tabBarItem.image = UIImage(systemName: "video.fill")
    }

}
