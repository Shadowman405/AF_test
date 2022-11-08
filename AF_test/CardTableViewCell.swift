//
//  CardTableViewCell.swift
//  AF_test
//
//  Created by Maxim Mitin on 8.11.22.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    
    
    func configCell(with card: CardMTG) {
        cardName.text = card.name
        
        guard let url = URL(string: card.imageURL ) else {return}

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.cardImage.image = UIImage(data: imageData)
            }
        }
    }

}
