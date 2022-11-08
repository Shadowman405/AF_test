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
    let cards = [CardMTG]()
    
    func fetchCards(){
        AF.request(urlMTG).responseJSON { responseData in
            switch responseData.result{
            case .success(let value):
                let json = JSON(value)
                for card in json {
//                    let newCard = CardMTG(name: json["cards"][card]["name"], type: json["cards"][card]["type"],imageURL: json["cards"][card]["imageURL"] originalType: json["cards"][card]["originalType"], id: json["cards"][card]["id"])
                    print(card)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
