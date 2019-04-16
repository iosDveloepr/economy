//
//  EconomyTableViewModel.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EconomyTableViewModel{
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var fetchedResultsController: NSFetchedResultsController<Economy>?
    
    func updateUI(completition: () -> Void){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Economy> = Economy.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            
            fetchedResultsController = NSFetchedResultsController<Economy>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            try? fetchedResultsController?.performFetch()
            completition()
        }
    }
    
}
