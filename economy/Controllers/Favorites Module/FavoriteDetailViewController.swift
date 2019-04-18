//
//  FavoriteDetailViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/19/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class FavoriteDetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteTitle: UILabel!
    @IBOutlet weak var favoriteDescription: UITextView!
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var favorite: Economy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp(){
        let toFavorite = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(addToFavorite))
        self.navigationItem.rightBarButtonItem = toFavorite
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
        guard let favorite = favorite else { return }
        
        favoriteTitle.text = favorite.term
        favoriteDescription.text = favorite.desc
        
        if favorite.isFavorite{
            self.navigationItem.rightBarButtonItem?.tintColor = .yellow
        }
    }
    
    @objc func addToFavorite(){
        
        guard let favorite = favorite else { return }
        
        if let context = container?.viewContext{
            if favorite.isFavorite{
                self.navigationItem.rightBarButtonItem?.tintColor = .white
                favorite.setValue(false, forKey: "isFavorite")
            } else {
                self.navigationItem.rightBarButtonItem?.tintColor = .yellow
                favorite.setValue(true, forKey: "isFavorite")
            }
            
            do{
                try context.save()
            } catch {
                print("Database error")
            }
        }
    }

}
