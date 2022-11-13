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
        setNameLbl.text = "Set name: \(card.setName)"
        cardTextLbl.text = card.text
        self.title = card.name
        manaCostLbl.text = "Mana Cost:  \(card.manaCost)"
        cardImg.fetchImage(from: card.imageURL)
        
    }

}
