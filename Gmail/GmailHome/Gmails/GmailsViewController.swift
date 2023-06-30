//
//  MailsViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class GmailsViewController: UIViewController {
    
    // MARK: - Variables
    
    static let id = "GmailsViewControllerID"
    private let cellHeight: CGFloat = 70
    private var spinnerTimer: Timer?
    private var isSpinnerVisible = false
    
    // MARK: - UI Components
    
    @IBOutlet weak var mailsContainerView: UIView!
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.collectionViewFlowLayout)
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
    
    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .gray
        spinner.hidesWhenStopped = true
        return spinner
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
        Gmail(image: UIImage(named: "user1")!, title: "Important Announcement", subtitle: "From: company@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur urna ut magna gravida vestibulum.", date: "June 25, 2023 at 9:15 AM"),
        Gmail(image: UIImage(named: "user2")!, title: "Invitation to Event", subtitle: "From: eventorganizer@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse cursus lacus sed ante tristique pretium.", date: "June 26, 2023 at 2:30 PM"),
        Gmail(image: UIImage(named: "user3")!, title: "Package Shipment Confirmation", subtitle: "From: shippingcompany@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget quam sed tellus congue consectetur.", date: "June 27, 2023 at 11:45 AM"),
        Gmail(image: UIImage(named: "user4")!, title: "Payment Receipt", subtitle: "From: payments@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper nisl sed pharetra cursus.", date: "June 28, 2023 at 5:20 PM"),
        Gmail(image: UIImage(named: "user5")!, title: "Job Application Status", subtitle: "From: hr@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris consectetur sollicitudin fermentum.", date: "June 29, 2023 at 9:10 AM"),
        Gmail(image: UIImage(named: "user6")!, title: "Vacation Booking Confirmation", subtitle: "From: travelagency@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non justo in enim elementum cursus.", date: "June 30, 2023 at 3:45 PM"),
        Gmail(image: UIImage(named: "user7")!, title: "Meeting Reminder", subtitle: "From: organizer@example.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vitae massa tristique, commodo purus nec.", date: "July 1, 2023 at 10:30 AM"),
        Gmail(image: UIImage(named: "user8")!, title: "New Product Launch", subtitle: "From: marketing@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor quam a risus ullamcorper.", date: "July 2, 2023 at 2:15 PM"),
        Gmail(image: UIImage(named: "user1")!, title: "Invoice Due Reminder", subtitle: "From: accounting@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae felis sed dolor tempor iaculis.", date: "July 3, 2023 at 9:45 AM"),
        Gmail(image: UIImage(named: "user2")!, title: "New Project Proposal", subtitle: "From: client@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non ligula eleifend, mattis tortor sed.", date: "July 4, 2023 at 4:20 PM"),
        Gmail(image: UIImage(named: "user3")!, title: "Newsletter Subscription Confirmation", subtitle: "From: newsletter@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis feugiat ligula non turpis efficitur.", date: "July 5, 2023 at 11:10 AM"),
        Gmail(image: UIImage(named: "user4")!, title: "Password Reset Request", subtitle: "From: security@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu ligula et turpis lobortis.", date: "July 6, 2023 at 6:05 PM"),
        Gmail(image: UIImage(named: "user5")!, title: "Promotion Announcement", subtitle: "From: promotions@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dignissim tortor ut orci tristique.", date: "July 7, 2023 at 1:55 PM"),
        Gmail(image: UIImage(named: "user6")!, title: "Event Registration Confirmation", subtitle: "From: events@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ultricies velit in feugiat iaculis.", date: "July 8, 2023 at 8:40 AM"),
        Gmail(image: UIImage(named: "user7")!, title: "Task Assignment", subtitle: "From: manager@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam efficitur metus et sollicitudin cursus.", date: "July 9, 2023 at 3:30 PM"),
        Gmail(image: UIImage(named: "user8")!, title: "New Feature Update", subtitle: "From: productteam@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam hendrerit ipsum eget diam finibus.", date: "July 10, 2023 at 10:20 AM"),
        Gmail(image: UIImage(named: "user1")!, title: "Request for Feedback", subtitle: "From: feedback@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac eros vel lacus congue eleifend.", date: "July 11, 2023 at 5:15 PM"),
        Gmail(image: UIImage(named: "user2")!, title: "Membership Renewal Reminder", subtitle: "From: membership@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac diam faucibus, bibendum ex id.", date: "July 12, 2023 at 9:50 AM"),
        Gmail(image: UIImage(named: "user3")!, title: "Important Announcement", subtitle: "From: administrator@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum a quam id lorem ultrices.", date: "July 13, 2023 at 4:40 PM"),
        Gmail(image: UIImage(named: "user4")!, title: "Team Building Event Invitation", subtitle: "From: teambuilding@examplecompany.com", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque faucibus velit vitae elit varius.", date: "July 14, 2023 at 11:30 AM")
    ]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stopTimer()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewFlowLayout.invalidateLayout()
    }
    
    // MARK: - UI Setup
    
    private func setupCollectionView() {
        
        setupButton()
        
        mailsContainerView.addSubview(collectionView)
        collectionView.addSubview(loadingSpinner)
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingSpinner.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            loadingSpinner.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30)
        ])
        
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
        
        composeButton.addTarget(self, action: #selector(composeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func composeButtonTapped() {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GmailComposeViewControllerID") as? GmailComposeViewController
        present(vc!, animated: true)
    }
    
    func configVC() {
        tabBarItem.image = UIImage(systemName: "envelope.fill")
    }
}

extension GmailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedGmail = data[indexPath.row]
        
        let sentLetterVC = TheSentLetterViewController()
        sentLetterVC.image = selectedGmail.image
        sentLetterVC.titleText = selectedGmail.title
        sentLetterVC.subtitle = selectedGmail.subtitle
        sentLetterVC.descriptionText = selectedGmail.description
        sentLetterVC.date = selectedGmail.date
        
        present(sentLetterVC, animated: true)
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

extension GmailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - scrollViewHeight && !isSpinnerVisible {
            showLoadingSpinner()
            startTimer()
        }
    }
    
    private func showLoadingSpinner() {
        isSpinnerVisible = true
        loadingSpinner.startAnimating()
    }
    
    private func hideLoadingSpinner() {
        isSpinnerVisible = false
        loadingSpinner.stopAnimating()
    }
    
    private func startTimer() {
        spinnerTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
            self?.hideLoadingSpinner()
            self?.spinnerTimer = nil
        }
    }
    
    private func stopTimer() {
        spinnerTimer?.invalidate()
        spinnerTimer = nil
    }
}
