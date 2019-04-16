//
//  RootRouter.swift
//  economy
//
//  Created by Yermakov Anton on 4/16/19.
//  Copyright © 2019 Yermakov Anton. All rights reserved.
//

import Foundation
import UIKit

class RootRouter {

    /// Get window for navigation
    var window: UIWindow?
    var currentUser = true
    
    // MARK: - SINGLETON
    static let shared: RootRouter = {
        let instance = RootRouter()
        return instance
    }()
    
 
    // MARK: - APPLICATION DIDFINISHLAUCHING WITH OPTIONS
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?, window: UIWindow) -> Bool {
        
        self.window = window
        
        if currentUser == true {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tabController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
             window.rootViewController = tabController
             window.makeKeyAndVisible()
        } else {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Authorization", bundle: nil)
            let tabController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
            window.rootViewController = tabController
            window.makeKeyAndVisible()
        }
        
        return true
   }

}


