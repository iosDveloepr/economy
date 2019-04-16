//
//  Business.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import CoreData

class Business: NSManagedObject {
    
    class func findOrCreateBusiness(matching topicInfo: Topic, in context: NSManagedObjectContext) throws -> Business{
        
        let request : NSFetchRequest<Business> = Business.fetchRequest()
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
        
        let business = Business(context: context)
        business.id = Int16(topicInfo.id)
        business.term = topicInfo.term
        business.desc = topicInfo.description
        business.category = topicInfo.category
        return business
    }
}
