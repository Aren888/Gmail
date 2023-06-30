//
//  MailsViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit
//import PureLayout

final class GmailsViewController: UIViewController {
    static let id = "GmailsViewControllerID"
    private let cellHeight: CGFloat = 70
    
    @IBOutlet weak var mailsContainerView: UIView!
    
    
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 4
        
        return collectionViewFlowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.collectionViewFlowLayout)
//        cv.register(MailCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(UINib(nibName: GmailsCell.id, bundle: nil), forCellWithReuseIdentifier: GmailsCell.id)
        cv.register(UINib(nibName: GmailsHeaderView.id, bundle: nil),
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: GmailsHeaderView.id)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    private let data: [Gmail] = [
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 1", subtitle: "Subtitile 1 Lorem ipsum dolor sit a met amas k", description: "Description 1 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 2", subtitle: "Subtitile 2 Lorem ipsum dolor sit a met amas k", description: "Description 2 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 3", subtitle: "Subtitile 3 Lorem ipsum dolor sit a met amas k", description: "Description 3 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 4", subtitle: "Subtitile 4 Lorem ipsum dolor sit a met amas k", description: "Description 4 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 5", subtitle: "Subtitile 5 Lorem ipsum dolor sit a met amas k", description: "Description 5 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 6", subtitle: "Subtitile 6 Lorem ipsum dolor sit a met amas k", description: "Description 6 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 7", subtitle: "Subtitile 7 Lorem ipsum dolor sit a met amas k", description: "Description 7 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 8", subtitle: "Subtitile 8 Lorem ipsum dolor sit a met amas k", description: "Description 8 Lorem ipsum dolor sit a met amas k"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Title 9", subtitle: "Subtitile 9 Lorem ipsum dolor sit a met amas k", description: "Description 9 Lorem ipsum dolor sit a met amas k")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewFlowLayout.invalidateLayout()
    }
    
    private func setupCollectionView() {

        mailsContainerView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: mailsContainerView.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: mailsContainerView.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: mailsContainerView.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: mailsContainerView.trailingAnchor)].forEach({$0.isActive = true})
    }
    

    
    func configVC() {
        tabBarItem.image = UIImage(systemName: "envelope.fill")
    }
}

extension GmailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO
    }
}

extension GmailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        return CGSize(width: collectionView.frame.width - inset.left - inset.right, height: cellHeight)
    }
}

extension GmailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GmailsCell.id, for: indexPath) as! GmailsCell
        cell.configure(with: self.data[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GmailsHeaderView.id, for: indexPath) as! GmailsHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 140)
    }
}
