//
//  GmailsCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

class GmailsCell: UICollectionViewCell {
    static let id = "GmailsCell"
    
//    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titlelabel.text = nil
        subTitleLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func configure(with mail: Gmail) {
        imageView.image = mail.image
        titlelabel.text = mail.title
        subTitleLabel.text = mail.subtitle
        descriptionLabel.text = mail.description
    }
}
