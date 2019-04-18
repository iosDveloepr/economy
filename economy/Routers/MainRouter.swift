//
//  FavoriteRouter.swift
//  economy
//
//  Created by Yermakov Anton on 4/19/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit

struct MainRouter: RouterProtocol{
    
    weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = nil
    }
    
    func presentFavoriteDetail(favorite: Economy){
        let detailController = controller(type: FavoriteDetailViewController.self)!
        detailController.favorite = favorite
        push(detailController)
    }
    
}
