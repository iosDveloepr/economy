//
//  Marketing.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import CoreData

class Marketing: NSManagedObject {
    
    class func findOrCreateMarketing(matching topicInfo: Topic, in context: NSManagedObjectContext) throws -> Marketing{
        
        let request : NSFetchRequest<Marketing> = Marketing.fetchRequest()
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
        
        let marketing = Marketing(context: context)
        marketing.id = Int16(topicInfo.id)
        marketing.term = topicInfo.term
        marketing.desc = topicInfo.description
        marketing.category = topicInfo.category
        return marketing
    }
}
