//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by jdcorn on 11/20/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    /// Create a custom UITableViewCell class with an updateviews() function that sets the labels to the reprsetative data
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    // MARK: - Helper functions
    func updateViews() {
        nameLable.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        websiteLabel.text = representative?.link
        phoneNumberLabel.text = representative?.phone
    }
}
