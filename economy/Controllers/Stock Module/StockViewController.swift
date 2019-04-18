//
//  StockViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/18/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class StockViewController: UIViewController {
    
    @IBOutlet weak var stockTitle: UILabel!
    @IBOutlet weak var stockDescription: UITextView!
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var stock: Economy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        let toFavorite = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem = toFavorite
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        guard let stock = stock else { return }
        
        stockTitle.text = stock.term
        stockDescription.text = stock.desc
        
        if stock.isFavorite{
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc func addToFavorite(){
        
        guard let stock = stock else { return }
        
        if let context = container?.viewContext{
            if stock.isFavorite{
                self.navigationItem.rightBarButtonItem?.tintColor = .white
                stock.setValue(false, forKey: "isFavorite")
            } else {
                self.navigationItem.rightBarButtonItem?.tintColor = .yellow
                stock.setValue(true, forKey: "isFavorite")
            }
            
            do{
                try context.save()
            } catch {
                print("Database error")
            }
        }
    }

}
