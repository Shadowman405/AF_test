// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let card = try? newJSONDecoder().decode(Card.self, from: jsonData)

import Foundation

// MARK: - CardElement
struct CardElement: Codable {
    let name: String
    let cmc: Int
    let colorIdentity: [String]
    let type: String
    let supertypes, types, subtypes: [String]
    let rarity, cardSet, setName, text: String
    let artist, number, layout, multiverseid: String
    let imageURL: String
    let foreignNames: [ForeignName]
    let printings: [String]
    let originalType: String
    let legalities: [LegalityElement]
    let id: String

    enum CodingKeys: String, CodingKey {
        case name, cmc, colorIdentity, type, supertypes, types, subtypes, rarity
        case cardSet = "set"
        case setName, text, artist, number, layout, multiverseid
        case imageURL = "imageUrl"
        case foreignNames, printings, originalType, legalities, id
    }
}

// MARK: - ForeignName
struct ForeignName: Codable {
    let name, type: String
    let flavor: JSONNull?
    let imageURL: String
    let language: String
    let multiverseid: Int

    enum CodingKeys: String, CodingKey {
        case name, type, flavor
        case imageURL = "imageUrl"
        case language, multiverseid
    }
}

// MARK: - LegalityElement
struct LegalityElement: Codable {
    let format: String
    let legality: LegalityEnum
}

enum LegalityEnum: String, Codable {
    case legal = "Legal"
}

typealias Card = [CardElement]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

struct CardMTG: Codable {
    let name: String
//    let cmc: Int
//    let colorIdentity: [String]
    let type: String
    //let supertypes, types, subtypes: [String]
//    let rarity, cardSet, setName, text: String
//    let artist, number, layout, multiverseid: String
    let imageURL: String
//    let foreignNames: [ForeignName]
//    let printings: [String]
    let originalType: String
//    let legalities: [LegalityElement]
    let id: String

//    enum CodingKeys: String, CodingKey {
//        case name, cmc, colorIdentity, type, supertypes, types, subtypes, rarity
//        case cardSet = "set"
//        case setName, text, artist, number, layout, multiverseid
//        case imageURL = "imageUrl"
//        case foreignNames, printings, originalType, legalities, id
//    }
    
    init?(cardData: [String: Any]) {
        name = cardData["name"] as? String ?? ""
        type = cardData["type"] as? String ?? ""
        imageURL = cardData["imageURL"] as? String ?? ""
        originalType = cardData["originalType"] as? String ?? ""
        id = cardData["id"] as? String ?? ""
    }
    
    static func getAllCards(from value: Any) -> [CardMTG]? {
        guard let value = value as? [String: Any] else { return []}
        guard let results = value["cards"] as? [[String: Any]] else {return []}
        return results.compactMap { CardMTG(cardData: $0) }
    }
}
