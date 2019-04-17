//
//  EconomyViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/17/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class EconomyViewController: UIViewController {
    
    var economy: Economy?
    
    @IBOutlet weak var economyTitle: UILabel!
    @IBOutlet weak var economyDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        setUp()

    }
    
    private func setUp(){
        let button1 = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem  = button1
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        economyTitle.text = economy?.term
        economyDescription.text = economy?.desc
    }
    
    @objc func addToFavorite(){
       
        if self.navigationItem.rightBarButtonItem?.tintColor == .white{
         self.navigationItem.rightBarButtonItem?.tintColor = .yellow
             print("added")
        } else {
            self.navigationItem.rightBarButtonItem?.tintColor = .white
            print("removed")
        }
    }
 

}
