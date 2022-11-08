//
//  NetworkManager.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let shared = NetworkManager()
    let urlMTG = "https://api.magicthegathering.io/v1/cards?page=311"
    
    
    func fetchCards(with completion: @escaping ([CardMTG]) -> ()) {
        var cards = [CardMTG]()
        let url = "https://api.magicthegathering.io/v1/cards?page=311"
        
        AF.request(url, method: .get).validate().responseJSON { responseData in
            switch responseData.result {
            case .success(let value):
                guard let cardData = value as? [[String: Any]] else {return}
                let json = JSON(value)
                
                
                for card in cardData {
                    print(card)
                    let newCard = CardMTG(cardData: card)
                    cards.append(newCard)
                    print(card)
                }
                
                DispatchQueue.main.async {
                    completion(cards)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
