//
//  EconomyViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/17/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class EconomyViewController: UIViewController {
    
    var economy: Economy?
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    @IBOutlet weak var economyTitle: UILabel!
    @IBOutlet weak var economyDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      setUp()
    }
    
    private func setUp(){
        let toFavorite = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem = toFavorite
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        guard let economy = economy else { return }
        
        economyTitle.text = economy.term
        economyDescription.text = economy.desc
        
        if economy.isFavorite{
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc func addToFavorite(){
        
        guard let economy = economy else { return }
       
        if let context = container?.viewContext{
            if economy.isFavorite{
                self.navigationItem.rightBarButtonItem?.tintColor = .white
                economy.setValue(false, forKey: "isFavorite")
            } else {
                self.navigationItem.rightBarButtonItem?.tintColor = .yellow
                economy.setValue(true, forKey: "isFavorite")
            }
            
            do{
                try context.save()
            } catch {
                print("Database error")
            }
        }
    }
 

}
