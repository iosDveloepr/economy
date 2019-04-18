//
//  FavoriteViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/18/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
     var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var economy = [Economy](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

   
    func updateUI(){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Economy> = Economy.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            request.predicate = NSPredicate(format: "isFavorite == %i", true)
            
            do {
              economy = try context.fetch(request)
            } catch {
                print("Core data error")
            }
        }
    }
    
}


extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return economy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        let topic = economy[indexPath.row]
        cell.setUp(topic: topic)
        return cell
    }
    
    
}
