//
//  RouterProtocol.swift
//  container test
//
//  Created by user on 3/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

import UIKit

protocol RouterProtocol {
    var presenter: UINavigationController? {get}
    func storyboard() -> UIStoryboard
    func controller<T>(type: T.Type) -> T? where T: UIViewController
}

extension RouterProtocol {
    
   func storyboard() -> UIStoryboard {
       let name: String = "\(type(of: self))".replacingOccurrences(of: "Router", with: "")
        return UIStoryboard(name: name, bundle: nil)
   }

    
    func controller<T>(type: T.Type) -> T? where T: UIViewController {
        let nameViewController = "\(Swift.type(of: T.self))".replacingOccurrences(of: ".Type", with: "")
        return storyboard().instantiateViewController(withIdentifier: nameViewController) as? T
    }
}

extension RouterProtocol {
    
    func present(_ controller: UIViewController, animated: Bool = true, complate: (() -> ())? = nil) {
        presenter?.present(controller, animated: animated, completion: complate)
    }
    
    func push(_ controller: UIViewController, animated: Bool = true) {
        presenter?.pushViewController(controller, animated: animated)
    }
    
    func popController(_ animated: Bool = true) {
        _ = presenter?.popViewController(animated: animated)
    }
    
    func popRootController(_ animated: Bool = true) {
        _ = presenter?.popToRootViewController(animated: animated)
    }
    
    func dismissController(_ animated: Bool = true, complate: (() -> ())? = nil) {
        presenter?.dismiss(animated: animated, completion: complate)
    }
    
    func popRootController(_ controller: UIViewController, animated: Bool = true) {
        _ = presenter?.popToViewController(controller, animated: animated)
    }
}
