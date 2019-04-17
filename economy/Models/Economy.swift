//
//  Economy.swift
//  economy
//
//  Created by Yermakov Anton on 4/14/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class Economy: NSManagedObject {
    
    class func findOrCreateEconomy(matching topicInfo: Topic, in context: NSManagedObjectContext) throws -> Economy{
        
        let request : NSFetchRequest<Economy> = Economy.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", topicInfo.id)
        
        do {
            let match = try context.fetch(request)
            if match.count > 0 {
                assert(match.count == 1, "Database inconsistency")
                return match[0]
            }
        } catch {
            throw error
        }
        
        let economy = Economy(context: context)
        economy.id = Int16(topicInfo.id)
        economy.term = topicInfo.term
        economy.desc = topicInfo.description
        economy.category = topicInfo.category
        economy.isFavorite = false
        return economy
    }
}
