//
//  CardTableViewCell.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImage: CardImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var rarityLbl: UILabel!
    
    
    func configCell(with card: CardMTG) {
        cardName.text = card.name
        rarityLbl.text = "Rarity:  \(card.rarity)"
        cardImage.fetchImage(from: card.imageURL)
        
//        guard let url = URL(string: card.imageURL ) else {return}
//
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else { return }
//            DispatchQueue.main.async {
//                if card.imageURL == "placeholder" {
//                    self.cardImage.image = UIImage(named:"placeholder")
//                } else {
//                    self.cardImage.image = UIImage(data: imageData)
//                }
//            }
//        }
    }

}
