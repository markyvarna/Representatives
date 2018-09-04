//
//  Representative.swift
//  Representatives
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import Foundation

struct Results: Codable {
    
    let results: [Representative]
    
}
struct Representative: Codable {
    
    //Properties
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
}

