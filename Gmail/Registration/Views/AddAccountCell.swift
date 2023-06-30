//
//  AddAccountCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

class AddAccountCell: UITableViewCell {
        static let id = "AddAccountCell"
        
        @IBOutlet weak var cellImageView: UIImageView!
        @IBOutlet weak var titleLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            cellImageView.image = nil
            titleLabel.text = nil
        }
        
        func configure(with account: AddAccount) {
            cellImageView.image = account.image.addImageAction()
            titleLabel.text = account.title.addTitleAction()
        }
    }


