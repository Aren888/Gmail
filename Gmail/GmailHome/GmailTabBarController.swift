//
//  GmailTabBarController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//


import UIKit

final class GmailTabBarController: UITabBarController {
    
    private var mailsVC: GmailsViewController?
    private var meetsVC: MeetsViewController?
    
    private var mainStoryBoard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupView()
        configTabBar()
    }
    
    //MARK: - Setup Methods
    
    private func setupView() {
        tabBar.layer.backgroundColor = UIColor.white.cgColor
        tabBar.backgroundColor = UIColor.white

        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        
        tabBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowOpacity = 1
    }
    
    private func setupViewControllers() {
        setupMailsViewController()
        setupMeetsViewController()
    }
    
    private func setupMailsViewController() {
        mailsVC = mainStoryBoard.instantiateViewController(withIdentifier: GmailsViewController.id) as? GmailsViewController
        mailsVC?.configVC()
    }
    

    private func setupMeetsViewController() {
        meetsVC = mainStoryBoard.instantiateViewController(withIdentifier: MeetsViewController.id) as? MeetsViewController
        meetsVC?.configVC()
    }
    
    private func configTabBar() {
        var vcs = [UIViewController]()
        if let mailsVC = mailsVC, let meetsVC = meetsVC {
            vcs.append(mailsVC)
            vcs.append(meetsVC)
        }
        viewControllers = vcs
        
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
}
