//
//  CardsTableViewController.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import UIKit

class CardsTableViewController: UITableViewController {
    
    private let manager = NetworkManager.shared
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetchCards()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CardTableViewCell

        return cell
    }
    
}
