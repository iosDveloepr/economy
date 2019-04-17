//
//  TopicsTableViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/13/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit
import CoreData

class EconomyTableViewController: FetchedResultsTableViewController {

    var economyViewModel = EconomyTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        economyViewModel.fetchedResultsController?.delegate = self
        economyViewModel.updateUI { [unowned self] in
             self.tableView.reloadData()
        }
    }
  
}

extension EconomyTableViewController{

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath) as! EconomyTableViewCell

        if let topic = economyViewModel.fetchedResultsController?.object(at: indexPath){
            cell.setUp(topic: topic)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let economy = economyViewModel.fetchedResultsController?.object(at: indexPath)
        EconomyRouter(presenter: navigationController.self).presentEconomyDetail(economy: economy!)
    }
    
}
