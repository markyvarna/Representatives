//
//  InfoViewController.swift
//  Representatives
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!
    
    var state2: String?
    var result: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state2 = state2 else {return}
        RepresentativeController.shared.searchRepresentatives(forState: state2) { (result) in
            guard let result = result else {return}
            DispatchQueue.main.async {
                self.result = result
                for i in result {
                    if i.state == state2 {
                        self.infoLabel.text = "Representative: \(i.name)  \n District: \(i.district) \n Office: \(i.office) \n Party: \(i.party) \n Phone: \(i.phone),  \n \(i.state)  \n \(i.link)"
                    } else {self.infoLabel.text = "Unkown"}
                }
                
            }
        }
    }
    
}
