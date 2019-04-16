//
//  MarketingTableViewModel.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MarketingTableViewModel{
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var fetchedResultsController: NSFetchedResultsController<Marketing>?
    
    func updateUI(completition: () -> Void){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Marketing> = Marketing.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            
            fetchedResultsController = NSFetchedResultsController<Marketing>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            try? fetchedResultsController?.performFetch()
            completition()
        }
    }
    
}
