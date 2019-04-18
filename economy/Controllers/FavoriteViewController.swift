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
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var economy = [Economy]()
    
    var filterdEconomy = [Economy](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
        segmentControl.selectedSegmentIndex = 0
    }

   
    func updateUI(){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Economy> = Economy.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            request.predicate = NSPredicate(format: "isFavorite == %i", true)
            
            do {
              economy = try context.fetch(request)
              filterdEconomy = economy
            } catch {
                print("Core data error")
            }
        }
    }
    
    
    @IBAction func categorySort(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            print("all")
            filterdEconomy = economy
        case 1:
            print("economy")
            filterdEconomy = economy.filter { ($0.category == "economy")}
        case 2:
            print("stock")
            filterdEconomy = economy.filter { ($0.category == "stock")}
        case 3:
            print("marketing")
            filterdEconomy = economy.filter { ($0.category == "marketing")}
        case 4:
            print("business")
            filterdEconomy = economy.filter { ($0.category == "business")}
        default:
            print("default")
        }
    }
    
}


extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdEconomy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        let topic = filterdEconomy[indexPath.row]
        cell.setUp(topic: topic)
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
