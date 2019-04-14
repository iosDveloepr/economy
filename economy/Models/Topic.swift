//
//  Topic.swift
//  economy
//
//  Created by Yermakov Anton on 4/14/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation

struct Topic: Decodable{
    var id: Int
    var term: String
    var description: String
    var category: String
}
