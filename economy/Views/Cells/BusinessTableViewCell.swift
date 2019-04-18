//
//  BusinessTableViewCell.swift
//  economy
//
//  Created by Yermakov Anton on 4/17/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    
    @IBOutlet weak var term: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(business: Economy){
        term.text = business.term
    }

}
