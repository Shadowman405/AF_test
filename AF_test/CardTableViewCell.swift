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
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
