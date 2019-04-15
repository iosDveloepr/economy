//
//  MainViewModel.swift
//  economy
//
//  Created by Yermakov Anton on 4/14/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData


class MainViewModel{
    
    let container : NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var dataManager: DataManager
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
    }
    
 
    func loadStationsFromJSON(resource: Topics) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        dataManager.getData(resource: resource) { (data) in
            
            defer {
                DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            }
            
            guard let data = data, let jsonDictionary = try? JSONDecoder().decode([String: [Topic]].self, from: data), let stationsArray = jsonDictionary[resource.rawValue] else {
                return
            }
            
            updateDatabase(resource: resource, topics: stationsArray)
        }
    }
    
    private func updateDatabase(resource: Topics, topics: [Topic]){
        container?.performBackgroundTask{ context in
            for topicInfo in topics{
                switch resource{
                case .Economy:
                    _ = try? Economy.findOrCreateEconomy(matching: topicInfo, in: context)
                case .Marketing:
                    _ = try? Marketing.findOrCreateMarketing(matching: topicInfo, in: context)
                default:
                    break
                }
            }
            try? context.save()
        }
    }
    
}
