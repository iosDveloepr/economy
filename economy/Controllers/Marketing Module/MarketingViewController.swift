//
//  MarketingViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/18/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class MarketingViewController: UIViewController {
    
    @IBOutlet weak var marketingTitle: UILabel!
    @IBOutlet weak var marketingDescription: UITextView!
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var marketing: Economy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        let toFavorite = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem = toFavorite
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        guard let marketing = marketing else { return }
        
        marketingTitle.text = marketing.term
        marketingDescription.text = marketing.desc
        
        if marketing.isFavorite{
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc func addToFavorite(){
        
        guard let marketing = marketing else { return }
        
        if let context = container?.viewContext{
            if marketing.isFavorite{
                self.navigationItem.rightBarButtonItem?.tintColor = .white
                marketing.setValue(false, forKey: "isFavorite")
            } else {
                self.navigationItem.rightBarButtonItem?.tintColor = .yellow
                marketing.setValue(true, forKey: "isFavorite")
            }
            
            do{
                try context.save()
            } catch {
                print("Database error")
            }
        }
    }

}
