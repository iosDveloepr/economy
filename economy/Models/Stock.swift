//
//  Stock.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import CoreData

class Stock: NSManagedObject {
    
    class func findOrCreateStock(matching topicInfo: Topic, in context: NSManagedObjectContext) throws -> Stock{
        
        let request : NSFetchRequest<Stock> = Stock.fetchRequest()
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
        
        let stock = Stock(context: context)
        stock.id = Int16(topicInfo.id)
        stock.term = topicInfo.term
        stock.desc = topicInfo.description
        stock.category = topicInfo.category
        return stock
    }
}
