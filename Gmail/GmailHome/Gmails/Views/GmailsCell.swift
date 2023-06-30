//
//  GmailsCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class GmailsCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    static let id = "GmailsCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        titlelabel.text = nil
        subTitleLabel.text = nil
        descriptionLabel.text = nil
        dateLabel.text = nil
    }
    
    // MARK: - Configuration
    
    func configure(with mail: Gmail) {
        
        imageView.image = mail.image
        titlelabel.text = mail.title
        subTitleLabel.text = mail.subtitle
        descriptionLabel.text = mail.description
        dateLabel.text = mail.date
    }
}
