//
//  StockRouter.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit

struct StockRouter: RouterProtocol{
    
    weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = nil
    }
    
    
    func getTopicContainercontroller() -> StockTableViewController {
        return controller(type: StockTableViewController.self)!
    }
    
    
    func presentStockModule(){
        let stockController = controller(type: StockTableViewController.self)!
        push(stockController)
    }
}
