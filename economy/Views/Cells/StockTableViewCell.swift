//
//  StockTableViewCell.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class StockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var term: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(stock: Economy){
        term.text = stock.term
    }
    

}
