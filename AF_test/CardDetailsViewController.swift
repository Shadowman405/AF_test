//
//  CardDetailsViewController.swift
//  AF_test
//
//  Created by Maxim Mitin on 9.11.22.
//

import UIKit

class CardDetailsViewController: UIViewController {
    
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardNameLbl: UILabel!
    
    var selectedCard: CardMTG?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        guard let card = selectedCard else { return }
        guard let cardImg = URL(string: card.imageURL) else {return}
        cardNameLbl.text = card.name
        //self.title = card.name
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: cardImg) else {return}
            DispatchQueue.main.async {
                self.cardImg.image = UIImage(data: data)
            }
        }
    }

}
