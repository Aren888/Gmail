//
//  MeetsCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit


class MeetsCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    static let id = "MeetsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadiusForImageView()
    }
    
    func setCornerRadiusForImageView() {
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
    }
    
    func configure(with meets: Meets) {
        imageView.image = meets.image
        titleLabel.text = meets.title
        subTitleLabel.text = meets.subTitle
    }
}
