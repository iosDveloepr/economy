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
    
    func loadStationsFromJSON() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        DataManager.getDataFromFileWithSuccess() { (data) in
            
            defer {
                DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            }
            
            guard let data = data, let jsonDictionary = try? JSONDecoder().decode([String: [Topic]].self, from: data), let stationsArray = jsonDictionary["Economy"] else {
                return
            }
            updateDatabase(with: stationsArray)
        }
    }
    
    private func updateDatabase(with topics: [Topic]){
        container?.performBackgroundTask{ context in
            for topicInfo in topics{
                _ = try? Economy.findOrCreateEconomy(matching: topicInfo, in: context)
            }
            try? context.save()
        }
    }
    
}
