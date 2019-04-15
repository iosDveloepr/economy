//
//  MarketingTableViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class MarketingTableViewController: FetchedResultsTableViewController {

    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var fetchedResultsController: NSFetchedResultsController<Marketing>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printDatabaseStatistic()
    }
    
    
    
    private func updateUI(){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Marketing> = Marketing.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            
            fetchedResultsController = NSFetchedResultsController<Marketing>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            try? fetchedResultsController?.performFetch()
            tableView.reloadData()
            fetchedResultsController?.delegate = self
        }
    }
    
    
    private func printDatabaseStatistic(){
        if let context = container?.viewContext{
            context.perform {
                if let marketing = try? context.count(for: Marketing.fetchRequest()){
                    print("\(marketing) accounts ammount")
                }
            }
        }
    }
   
}

extension MarketingTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketingCell", for: indexPath) as! MarketingTableViewCell
        
        if let marketing = fetchedResultsController?.object(at: indexPath){
            cell.setUp(marketing: marketing)
        }
        
        return cell
    }
}