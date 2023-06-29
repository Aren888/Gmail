//
//  MailsHeaderView.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class MailsHeaderView: UICollectionReusableView {
    static let id = "MailsHeaderView"

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .green
    }
}
