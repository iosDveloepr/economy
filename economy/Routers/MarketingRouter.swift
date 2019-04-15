//
//  MarketingRouter.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit

struct MarketingRouter: RouterProtocol{
    
    weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = nil
    }
    
    
    func getTopicContainercontroller() -> EconomyTableViewController {
        return controller(type: EconomyTableViewController.self)!
    }
    
    func presentMarketingModule(){
        let topicController = controller(type: MarketingTableViewController.self)!
        push(topicController)
    }
}
