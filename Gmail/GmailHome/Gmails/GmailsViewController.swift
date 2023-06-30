//
//  MailsViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit
//import PureLayout

final class GmailsViewController: UIViewController {
    
    // MARK: - Variables
    
    static let id = "GmailsViewControllerID"
    private let cellHeight: CGFloat = 70
    
    // MARK: - UI Components
    
    @IBOutlet weak var mailsContainerView: UIView!
    
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
    
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 4
        
        return collectionViewFlowLayout
    }()
    
    private lazy var composeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("compose", for: .normal)
        button.backgroundColor = .white
   
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func buttonTapped() {
        // Handle button tap event
    }
    
    
    private let data: [Gmail] = [
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Important Announcement", subtitle: "From: company@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur urna ut magna gravida vestibulum.", date: "June 25, 2023 at 9:15 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Invitation to Event", subtitle: "From: eventorganizer@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse cursus lacus sed ante tristique pretium.", date: "June 26, 2023 at 2:30 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Package Shipment Confirmation", subtitle: "From: shippingcompany@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget quam sed tellus congue consectetur.", date: "June 27, 2023 at 11:45 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Payment Receipt", subtitle: "From: payments@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper nisl sed pharetra cursus.", date: "June 28, 2023 at 5:20 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Job Application Status", subtitle: "From: hr@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consectetur sollicitudin fermentum.", date: "June 29, 2023 at 9:10 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Vacation Booking Confirmation", subtitle: "From: travelagency@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non justo in enim elementum cursus.", date: "June 30, 2023 at 3:45 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Meeting Reminder", subtitle: "From: organizer@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae massa tristique, commodo purus nec.", date: "July 1, 2023 at 10:30 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "New Product Launch", subtitle: "From: marketing@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor quam a risus ullamcorper.", date: "July 2, 2023 at 2:15 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Invoice Due Reminder", subtitle: "From: accounting@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae felis sed dolor tempor iaculis.", date: "July 3, 2023 at 9:45 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "New Project Proposal", subtitle: "From: client@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non ligula eleifend, mattis tortor sed.", date: "July 4, 2023 at 4:20 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Newsletter Subscription Confirmation", subtitle: "From: newsletter@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis feugiat ligula non turpis efficitur.", date: "July 5, 2023 at 11:10 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Password Reset Request", subtitle: "From: security@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula et turpis lobortis.", date: "July 6, 2023 at 6:05 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Promotion Announcement", subtitle: "From: promotions@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dignissim tortor ut orci tristique.", date: "July 7, 2023 at 1:55 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Event Registration Confirmation", subtitle: "From: events@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies velit in feugiat iaculis.", date: "July 8, 2023 at 8:40 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Task Assignment", subtitle: "From: manager@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam efficitur metus et sollicitudin cursus.", date: "July 9, 2023 at 3:30 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "New Feature Update", subtitle: "From: productteam@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam hendrerit ipsum eget diam finibus.", date: "July 10, 2023 at 10:20 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Request for Feedback", subtitle: "From: feedback@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac eros vel lacus congue eleifend.", date: "July 11, 2023 at 5:15 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Membership Renewal Reminder", subtitle: "From: membership@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac diam faucibus, bibendum ex id.", date: "July 12, 2023 at 9:50 AM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Important Announcement", subtitle: "From: administrator@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a quam id lorem ultrices.", date: "July 13, 2023 at 4:40 PM"),
        Gmail(image: UIImage(systemName: "person.circle")!, title: "Team Building Event Invitation", subtitle: "From: teambuilding@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque faucibus velit vitae elit varius.", date: "July 14, 2023 at 11:30 AM")
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewFlowLayout.invalidateLayout()
    }
    
    
    // MARK: - UI Setup
    
    private func setupCollectionView() {
        
        setupButton()

        mailsContainerView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: mailsContainerView.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: mailsContainerView.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: mailsContainerView.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: mailsContainerView.trailingAnchor)].forEach({$0.isActive = true})
    }
    
    private func setupButton() {
        view.addSubview(composeButton)
        composeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let penImage = UIImage(systemName: "pencil")?.withRenderingMode(.alwaysTemplate)
        composeButton.setImage(penImage, for: .normal)
        composeButton.tintColor = .red
        composeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        
        composeButton.setTitleColor(.red, for: .normal)
        
        NSLayoutConstraint.activate([
            composeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            composeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            composeButton.widthAnchor.constraint(equalToConstant: 120),
            composeButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        composeButton.layer.cornerRadius = 26
        
        composeButton.layer.shadowColor = UIColor.black.cgColor
        composeButton.layer.shadowOpacity = 0.2
        composeButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        composeButton.layer.shadowRadius = 4
    }




    
    // MARK: - Selectors
    
    func configVC() {
        tabBarItem.image = UIImage(systemName: "envelope.fill")
    }
}

extension GmailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO
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
        return CGSize(width: collectionView.bounds.size.width, height: 98)
    }
}

extension GmailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset = (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        return CGSize(width: collectionView.frame.width - inset.left - inset.right, height: cellHeight)
    }
}
