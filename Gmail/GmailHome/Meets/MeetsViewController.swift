//
//  MeetsViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 29.06.23.
//

import UIKit

final class MeetsViewController: UIViewController {
    static let id = "MeetsViewControllerID"
    @IBOutlet weak var MeetsContainerView: UIView!
    @IBOutlet weak var newMeetingButton: UIButton!
    @IBOutlet weak var joinWithCodeButton: UIButton!
    @IBOutlet weak var profile: UIImageView!
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.collectionViewFlowLayout)
        cv.register(UINib(nibName: MeetsCell.id, bundle: nil), forCellWithReuseIdentifier: MeetsCell.id)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumLineSpacing = 4
        return collectionViewFlowLayout
    }()
    
    var meetsData: [Meets] = [
        Meets(image: UIImage(named: "image1")!, title: "Get a link you can share", subTitle: "Tap new meeting to get a link you can send to people you want to meet with"),
        Meets(image: UIImage(named: "image2")!, title: "Meeting 2", subTitle: "SubTitle 2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setCornerRadiusForButtons()
    }
    
    func configVC() {
        tabBarItem.image = UIImage(systemName: "video.fill")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionViewFlowLayout.invalidateLayout()
    }
    
    private func setupCollectionView() {
        MeetsContainerView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: MeetsContainerView.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: MeetsContainerView.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: MeetsContainerView.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: MeetsContainerView.trailingAnchor)].forEach({$0.isActive = true})
    }
    
    
    private func setCornerRadiusForButtons() {
          newMeetingButton.layer.cornerRadius = newMeetingButton.bounds.height / 2
          newMeetingButton.clipsToBounds = true
          
          joinWithCodeButton.layer.cornerRadius = joinWithCodeButton.bounds.height / 2
          joinWithCodeButton.clipsToBounds = true
        
        profile.layer.cornerRadius = profile.bounds.height / 2
        profile.clipsToBounds = true
      }
    
    
    @IBAction func menuAction(_ sender: Any) {
        // Handle menu action
    }
    
    @IBAction func newMeetingAction(_ sender: Any) {
        // Handle new meeting action
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            // Add actions
            alertController.addAction(UIAlertAction(title: "Get a meeting link to share", style: .default))
            alertController.addAction(UIAlertAction(title: "Start an instant meeting", style: .default))
            alertController.addAction(UIAlertAction(title: "Schedule in Google Calendar", style: .default))
            
            // Add a cancel action
            alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            
            // Present the alert
            present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func joinWithCodeAction(_ sender: Any) {
        // Handle join with code action
        let alertController = UIAlertController(title: "Join Meeting", message: "Enter the code provided by the meeting organizer", preferredStyle: .alert)
            
            // Add a text field to the alert
            alertController.addTextField { textField in
                textField.placeholder = "Meeting code"
            }
            
            // Add a cancel action
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            // Add a join action
            alertController.addAction(UIAlertAction(title: "Join", style: .default) { _ in
                // Retrieve the entered meeting code from the text field
                if let meetingCode = alertController.textFields?.first?.text {
                    // Perform the join action with the entered meeting code
                    // TODO: Implement the join action with the meeting code
                }
            })
            
            // Present the alert
            present(alertController, animated: true, completion: nil)
    }
}

extension MeetsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension MeetsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO
    }
}

extension MeetsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meetsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeetsCell.id, for: indexPath) as! MeetsCell
        let meets = meetsData[indexPath.row]
        cell.configure(with: meets)
        return cell
    }
}
