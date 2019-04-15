//
//  DataManager.swift
//  economy
//
//  Created by Yermakov Anton on 4/14/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation

class FileDataManager: DataManager{
    
    func getData(resource: Topics, success: (Data?) -> Void) {
        guard let filePathURL = Bundle.main.url(forResource: resource.rawValue, withExtension: "json") else {
            success(nil)
            return
        }
        do {
            let data = try Data(contentsOf: filePathURL, options: .uncached)
            success(data)
        } catch {
            fatalError()
        }
    }
    
}
