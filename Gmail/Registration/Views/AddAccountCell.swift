//
//  AddAccountCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

final class AddAccountCell: UITableViewCell {
    // MARK: - Constants
    
    static let id = "AddAccountCell"
    
    // MARK: - UI Components
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
        titleLabel.text = nil
    }
    
    // MARK: - Configure Method
    
    func configure(with account: AddAccount) {
        cellImageView.image = account.image.addImageAction()
        titleLabel.text = account.title.addTitleAction()
    }
}

