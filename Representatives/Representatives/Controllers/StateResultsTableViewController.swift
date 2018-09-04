//
//  StateResultsTableViewController.swift
//  Representatives
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class StateResultsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        cell.textLabel?.text = States.all[indexPath.row]

        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToReps" {
            let destinationvc = segue.destination as? RepresentativeTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let statePressed = States.all[indexPath.row]
            destinationvc?.state = statePressed
        }
        
        
    }
    

}
