//
//  StockTableViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class StockTableViewController: FetchedResultsTableViewController {

    var economyViewModel = EconomyTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        economyViewModel.fetchedResultsController?.delegate = self
        economyViewModel.updateUI(withTopic: "stock") { [unowned self] in
            self.tableView.reloadData()
        
        }
    }
    
}

extension StockTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = economyViewModel.fetchedResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockTableViewCell
        
        if let stock = economyViewModel.fetchedResultsController?.object(at: indexPath){
            cell.setUp(stock: stock)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stock = economyViewModel.fetchedResultsController?.object(at: indexPath)
        StockRouter(presenter: navigationController.self).presentStockDetail(stock: stock!)
    }
}
