//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by jdcorn on 11/20/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    /// Add a computed property of type [representative] that will be used to populate the table view.
    var representatives: [Representative] = [] {
        
        /// didSet reload table view
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    /// Add an option state property of type String
    /// This will be set by the statelistviewcontroller in the prepare for segue function
    var state: String?
    
    // MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (repArray) in
                self.representatives = repArray
                DispatchQueue.main.async {
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        cell.representative = representatives[indexPath.row]

        return cell
    }

}
