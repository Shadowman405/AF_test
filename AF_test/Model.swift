// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let card = try? newJSONDecoder().decode(Card.self, from: jsonData)

import Foundation

struct CardMTG: Codable {
    let name: String
//    let cmc: Int
//    let colorIdentity: [String]
    let type: String
    let rarity: String
    let setName: String
    let imageURL: String
    let manaCost: String
    let text: String
//    let foreignNames: [ForeignName]
//    let printings: [String]
    let originalType: String
//    let legalities: [LegalityElement]
    let id: String
    
    init?(cardData: [String: Any]) {
        name = cardData["name"] as? String ?? ""
        type = cardData["type"] as? String ?? ""
        imageURL = cardData["imageUrl"] as? String ?? "placeholder"
        originalType = cardData["originalType"] as? String ?? ""
        id = cardData["id"] as? String ?? ""
        rarity = cardData["rarity"] as? String ?? ""
        manaCost = cardData["manaCost"] as? String ?? ""
        setName = cardData["setName"] as? String ?? ""
        text = cardData["text"] as? String ?? ""
    }
    
    static func getAllCards(from value: Any) -> [CardMTG]? {
        guard let value = value as? [String: Any] else { return []}
        guard let results = value["cards"] as? [[String: Any]] else {return []}
        return results.compactMap { CardMTG(cardData: $0) }
    }
}
