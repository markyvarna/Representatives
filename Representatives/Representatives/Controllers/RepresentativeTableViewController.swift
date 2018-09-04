//
//  RepresentativeTableViewController.swift
//  Representatives
//
//  Created by Markus Varner on 9/3/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class RepresentativeTableViewController: UITableViewController {
    
    //MARK: - Landing Pad
    var state: String?
    var result: [Representative] = []

   
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let state = state else {return}
        RepresentativeController.shared.searchRepresentatives(forState: state) { (result) in
            guard let result = result else {return}
            DispatchQueue.main.async {
                self.result = result
                self.tableView.reloadData()
            }
        }
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath)
        cell.textLabel?.text = result[indexPath.row].name
        cell.detailTextLabel?.text = result[indexPath.row].party
        return cell
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfo" {
            let destinationvc = segue.destination as? InfoViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let statePressed = States.all[indexPath.row]
            destinationvc?.state2 = statePressed
        }
    }
    

}
