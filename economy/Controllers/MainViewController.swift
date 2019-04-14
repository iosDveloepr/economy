//
//  ViewController.swift
//  economy
//
//  Created by Yermakov Anton on 4/13/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadStationsFromJSON()
    }
    

    
    @IBAction func toTopicBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
           TopicRouter(presenter: self.navigationController).presentTopic(paramsTopic: "economy")
        case 1:
            TopicRouter(presenter: self.navigationController).presentTopic(paramsTopic: "stock")
        case 2:
             TopicRouter(presenter: self.navigationController).presentTopic(paramsTopic: "business")
        case 3:
            TopicRouter(presenter: self.navigationController).presentTopic(paramsTopic: "marketing")
        default:
            break
        }
    }
    
}

