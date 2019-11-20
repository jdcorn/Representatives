//
//  Representative.swift
//  Representative
//
//  Created by jdcorn on 11/20/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import Foundation

/// Create a respresetative struct, conforming to Codable.
struct Representative: Codable {
    
    /// Search the API for properties
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}

/// At this point, for this project, open the plist file  to turn off the app transport security feature.
