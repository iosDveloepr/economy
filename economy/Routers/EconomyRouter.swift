//
//  NextVCRouter.swift
//  container test
//
//  Created by user on 3/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation
import UIKit

struct EconomyRouter: RouterProtocol{
    
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
    
    
    func presentEconomicModule(){
        let topicController = controller(type: EconomyTableViewController.self)!
        push(topicController)
    }
}
