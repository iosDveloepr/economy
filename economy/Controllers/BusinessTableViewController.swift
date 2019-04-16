//
//  BusinessTableViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit

class BusinessTableViewController: FetchedResultsTableViewController {

    var businessViewModel = BusinessTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        businessViewModel.fetchedResultsController?.delegate = self
        businessViewModel.updateUI { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
}

extension BusinessTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = businessViewModel.fetchedResultsController?.sections, sections.count > 0 {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath) as! BusinessTableViewCell
        
        if let business = businessViewModel.fetchedResultsController?.object(at: indexPath){
            cell.setUp(business: business)
        }
        
        return cell
    }
}
