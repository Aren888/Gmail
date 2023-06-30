//
//  MailsHeaderView.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class GmailsHeaderView: UICollectionReusableView {
    
    static let id = "GmailsHeaderView"

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func menu(_ sender: Any) {
        
    }
}

