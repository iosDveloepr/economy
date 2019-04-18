//
//  ViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/13/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let dataManager = FileDataManager()
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel(dataManager: dataManager)
        viewModel.loadDataFromJSON(resource: Topics.Economy)
        viewModel.loadDataFromJSON(resource: Topics.Marketing)
        viewModel.loadDataFromJSON(resource: Topics.Business)
        viewModel.loadDataFromJSON(resource: Topics.Stock)
    }
    

    
    @IBAction func toTopicBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            EconomyRouter(presenter: self.navigationController).presentEconomicModule()
        case 1:
            MarketingRouter(presenter: self.navigationController).presentMarketingModule()
        case 2:
            BusinessRouter(presenter: self.navigationController).presentBusinessModule()
        case 3:
            StockRouter(presenter: self.navigationController).presentStockModule()
        default:
            break
        }
    }
    
}

