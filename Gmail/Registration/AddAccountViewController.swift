//
//  AddAccountViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

class AddAccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var data: [AddAccount] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AddAccountCell", bundle: nil), forCellReuseIdentifier: AddAccountCell.id)
    }
    
    func setUpData() {
        let myData: [AddAccount] = [
            AddAccount(image: .googleImage, title: .google),
            AddAccount(image: .iCloudImage, title: .iCloud),
            AddAccount(image: .outlookImage, title: .outlookHotmailAndLive),
            AddAccount(image: .officeImage, title: .office365),
            AddAccount(image: .yahooImage, title: .yahoo),
            AddAccount(image: .otherImage, title: .otherImap)
        ]
        
        data = myData
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension AddAccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddAccountCell.id, for: indexPath) as! AddAccountCell
        cell.configure(with: data[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedAccount = data[indexPath.row]
        let previewViewController = PreviewViewController()
        previewViewController.account = selectedAccount
        
        // Present the preview view controller
        present(previewViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
