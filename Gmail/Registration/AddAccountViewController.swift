//
//  AddAccountViewController.swift
//  Gmail
//
//  Created by Aren Musayelyan on 30.06.23.
//

import UIKit

import UIKit

class AddAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and delegate of the table view to self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func back(_ sender: Any) {
        // Handle back button action
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the table view
        return 5 // Replace with the actual number of rows you want to display
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        
        // Configure the cell with the necessary data
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Perform any necessary actions when a row is selected
        let selectedRow = indexPath.row
        print("Selected Row: \(selectedRow)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Specify the height of each row
        return 44.0 // Replace with your desired row height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Return a custom view for the header of the section
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Specify the height of the header for the section
        return 30.0 // Replace with your desired header height
    }
    
    // Add more UITableViewDelegate methods as needed
    
}
