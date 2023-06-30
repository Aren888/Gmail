//
//  MailsHeaderView.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class GmailsHeaderView: UICollectionReusableView {
    
    // MARK: - Constants
    
    static let id = "GmailsHeaderView"
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    
    
    @IBAction func menu(_ sender: Any) {
        
    }
}

