//
//  CardsTableViewController.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import UIKit

class CardsTableViewController: UITableViewController {
    
    private let manager = NetworkManager.shared
    var cards: [CardMTG] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
        fetchCards()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cards.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let cardDetailVC = segue.destination as! CardDetailsViewController
            let selectedRow = tableView.indexPathForSelectedRow!.row
            cardDetailVC.selectedCard = cards[selectedRow]
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCard", for: indexPath) as! CardTableViewCell
        let card = cards[indexPath.row]
        cell.configCell(with: card)

        return cell
    }
    
    
    func fetchCards() {
        manager.fetchCards { card in
            self.cards = card
            self.tableView.reloadData()
            print(self.cards[0].imageURL)
        }
    }
    
    @IBAction func beepBtn(_ sender: Any) {
        //fetchCards()
        print(cards[0])
    }
    
    
}
