//
//  MeetsCell.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit


final class MeetsCell: UICollectionViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    // MARK: - Constants
    
    static let id = "MeetsCell"
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadiusForImageView()
    }
    
    // MARK: - UI Setup
    
    func setCornerRadiusForImageView() {
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
    }
    
    // MARK: - Cell Configuration
    
    func configure(with meets: Meets) {
        
        imageView.image = meets.image
        titleLabel.text = meets.title
        subTitleLabel.text = meets.subTitle
    }
}
