//
//  BusinessTableViewModule.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BusinessTableViewModel{
    
    var container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var fetchedResultsController: NSFetchedResultsController<Business>?
    
    func updateUI(completition: () -> Void){
        if let context = container?.viewContext{
            
            let request : NSFetchRequest<Business> = Business.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
            
            fetchedResultsController = NSFetchedResultsController<Business>(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            try? fetchedResultsController?.performFetch()
            completition()
        }
    }
}
