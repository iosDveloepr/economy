//
//  BusinessViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/18/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class BusinessViewController: UIViewController {
    
    @IBOutlet weak var businessTitle: UILabel!
    @IBOutlet weak var businessDescription: UITextView!
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var business: Economy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        let toFavorite = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem = toFavorite
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        guard let business = business else { return }
        
        businessTitle.text = business.term
        businessDescription.text = business.desc
        
        if business.isFavorite{
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc func addToFavorite(){
        
        guard let business = business else { return }
        
        if let context = container?.viewContext{
            if business.isFavorite{
                self.navigationItem.rightBarButtonItem?.tintColor = .white
                business.setValue(false, forKey: "isFavorite")
            } else {
                self.navigationItem.rightBarButtonItem?.tintColor = .yellow
                business.setValue(true, forKey: "isFavorite")
            }
            
            do{
                try context.save()
            } catch {
                print("Database error")
            }
        }
    }

}
