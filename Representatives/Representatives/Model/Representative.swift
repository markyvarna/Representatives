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
enum States {
    static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
}
