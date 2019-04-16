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

    var marketingViewModel = MarketingTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        marketingViewModel.fetchedResultsController?.delegate = self
        marketingViewModel.updateUI { [unowned self] in
            self.tableView.reloadData()
        }
    }
  
}

extension MarketingTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = marketingViewModel.fetchedResultsController?.sections, sections.count > 0 {
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
        
        if let marketing = marketingViewModel.fetchedResultsController?.object(at: indexPath){
            cell.setUp(marketing: marketing)
        }
        
        return cell
    }
}
