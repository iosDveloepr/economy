//
//  MarketingTableViewCell.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class MarketingTableViewCell: UITableViewCell {

    @IBOutlet weak var term: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(marketing: Marketing){
        term.text = marketing.term
    }

}
