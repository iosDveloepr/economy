//
//  NextVCRouter.swift
//  container test
//
//  Created by user on 3/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation
import UIKit

struct TopicRouter: RouterProtocol{
    
    weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController?) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = nil
    }
    

    func getTopicContainercontroller() -> TopicsTableViewController {
        return controller(type: TopicsTableViewController.self)!
    }
    
    
    func presentTopic(paramsTopic: String){
        let topicController = controller(type: TopicsTableViewController.self)!
        topicController.topic = paramsTopic
        push(topicController)
    }
    
}
