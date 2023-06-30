//
//  PrewiewViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

protocol PreviewViewControllerDelegate: AnyObject {
    func continueButtonTapped(vc: PreviewViewController, account: AddAccount)
}

final class PreviewViewController: UIViewController {
    
    var account: AddAccount?
    
    weak var delegate: PreviewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        view.alpha = 0.9
        let titleLabel = UILabel()
        titleLabel.text = account?.title.addTitleAction()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let imageView = UIImageView()
        imageView.image = account?.image.addImageAction()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let continueButton = UIButton(type: .system)
        continueButton.titleLabel?.tintColor = .black
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40)
        ])
    }
    
    @objc func continueButtonTapped() {
        guard let account = account else { return }
        delegate?.continueButtonTapped(vc: self, account: account)
    }
}
