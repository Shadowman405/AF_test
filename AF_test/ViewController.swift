//
//  ViewController.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var textLbl: UILabel!
    let urlMTG = "https://api.magicthegathering.io/v1/cards?page=311"
    var cards = [CardElement]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchCards() {
        AF.request(urlMTG).validate().responseJSON { responseData in
            switch responseData.result {
            case .success(let value):
                let json = JSON(value)
                print("\(json["cards"][44])")
                self.textLbl.text = "NAME: \(json["cards"][44]["name"])" + "MANA COST: \n\(json["cards"][44]["manaCost"])" +
                "RARITY: \n\(json["cards"][44]["rarity"])"
//                DispatchQueue.main.async {
//                    self.textLbl.text = "\(value)"
//                    let someCards = value
//                    //   let card = try? newJSONDecoder().decode(Card.self, from: jsonData)
//                    let card = try? JSONDecoder().decode(CardElement.self, from: value ?? Data())
//                    print(card)
//                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @IBAction func fetchPressed(_ sender: Any) {
        fetchCards()
    }
    
}

 
