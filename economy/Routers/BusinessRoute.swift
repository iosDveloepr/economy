//
//  BusinessRoute.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit

struct BusinessRouter: RouterProtocol{
    
    weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = nil
    }
    
    
    func getBusinessContainercontroller() -> BusinessTableViewController {
        return controller(type: BusinessTableViewController.self)!
    }
    
    func presentBusinessModule(){
        let topicController = controller(type: BusinessTableViewController.self)!
        push(topicController)
    }
    
    func presentBusinessDetail(business: Economy){
        let detailController = controller(type: BusinessViewController.self)!
        detailController.business = business
        push(detailController)
    }
}
