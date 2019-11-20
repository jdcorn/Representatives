//
//  StateListTableViewController.swift
//  Representative
//
//  Created by jdcorn on 11/20/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// Implement the UITableViewDataCource functions using the included all states array in the states.swift file
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        /// setup your cells to display the name of each state
        let state = States.all[indexPath.row]
        
        /// set up your cells to display the name of each state
        cell.textLabel?.text = state
        

        return cell
    }


    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStateDetail" {
            guard let destinationVC = segue.destination as? StateDetailTableViewController, let index =
                tableView.indexPathForSelectedRow else {return}
            
            destinationVC.state = States.all[index.row]
        }
    }
}
