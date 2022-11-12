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
        //var cards = [CardMTG]()
        let url = "https://api.magicthegathering.io/v1/cards?page=311"
        
        AF.request(url, method: .get).validate().responseJSON { responseData in
            switch responseData.result {
            case .success(let value):
                guard let cardData = CardMTG.getAllCards(from: value) else {return}
                
                
                DispatchQueue.main.async {
                    completion(cardData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, completion: @escaping (Data,URLResponse) -> ()) {
        //print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let rescponse = response else {print(error?.localizedDescription ?? "Error, no description")
                return
            }
            
            guard url == rescponse.url else {return}
            
            completion(data, rescponse)
        }.resume()
    }
}
