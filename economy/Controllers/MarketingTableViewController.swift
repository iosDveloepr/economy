//
//  MarketingTableViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/15/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class MarketingTableViewController: FetchedResultsTableViewController {

    var economyViewModel = EconomyTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        economyViewModel.fetchedResultsController?.delegate = self
        economyViewModel.updateUI(withTopic: "marketing") { [unowned self] in
            self.tableView.reloadData()
        }
    }
  
}

extension MarketingTableViewController{
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "marketingCell", for: indexPath) as! MarketingTableViewCell
        
        if let marketing = economyViewModel.fetchedResultsController?.object(at: indexPath){
            cell.setUp(marketing: marketing)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let marketing = economyViewModel.fetchedResultsController?.object(at: indexPath)
        MarketingRouter(presenter: navigationController.self).presentMarketingDetail(marketing: marketing!)
    }
    
}
