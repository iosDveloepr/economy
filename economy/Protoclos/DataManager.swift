//
//  DataManager.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation

protocol DataManager {
    func getData(resource: Topics, success: (_ data: Data?) -> Void)
}
