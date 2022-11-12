//
//  CardDetailsViewController.swift
//  AF_test
//
//  Created by Maxim Mitin on 9.11.22.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardImg: CardImageView!
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var setNameLbl: UILabel!
    @IBOutlet weak var manaCostLbl: UILabel!
    @IBOutlet weak var cardTextLbl: UILabel!
    
    
    
    
    var selectedCard: CardMTG?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        cardNameLbl.isHidden = true
        
    }
    
    func configView() {
        guard let card = selectedCard else { return }
        //guard let cardImg = URL(string: card.imageURL) else {return}
        //cardNameLbl.text = card.name
        setNameLbl.text = "Set name: \(card.setName)"
        cardTextLbl.text = card.text
        self.title = card.name
        manaCostLbl.text = "Mana Cost:  \(card.manaCost)"
        //cardImg.fetchImage(from: card.imageURL)
        
//        DispatchQueue.global().async {
//            guard let data = try? Data(contentsOf: cardImg) else {return}
//            DispatchQueue.main.async {
//                self.cardImg.image = UIImage(data: data)
//                //self.cardImg.fetchImage(from: card.imageURL)
//            }
//        }
        
        DispatchQueue.main.async {
            self.cardImg.fetchImage(from: card.imageURL)
        }
    }

}
