//
//  BaseViewController.swift
//  container test
//
//  Created by user on 3/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func addTapOnScreen() {
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(hideKeyboard))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// Bottom view constraint for keyboard
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!
    
    var correction:CGFloat = 0.0
    
    var isShowKeyboard = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint(" didReceiveMemoryWarning ----->>>> \(viewControllerName)")
    }
    
    deinit {
        debugPrint(" deinit ----->>>> \(viewControllerName)")
    }
    
    
    // MARK: -
    // MARK: setup
    
    private func setup() {
        addTapOnScreen()
        navigationItem.backBarButtonItem?.title = ""
     }
    

    
    /// View Will Apper
    ///
    /// - parameter animated: is animated
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// View will disappear
    ///
    /// - parameter animated: is animated
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /// View did disappear
    ///
    /// - parameter animated: is animated
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
 
    }
    
    /// Keyboard will hide
    ///
    /// - parameter notification: object notification
    @objc func keyboardWillHide(_ notification : Notification) {
        if bottomViewConstraint != nil {
            bottomViewConstraint!.constant = 0
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /// Keyboard will show
    ///
    /// - parameter notification: object notification
    @objc func keyboardWillShow(_ notification: Notification) {
        isShowKeyboard = true
        if bottomViewConstraint != nil {
            var info = notification.userInfo!
            let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            bottomViewConstraint!.constant = keyboardFrame.size.height + correction
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    /// Hide keyboard
    @objc func hideKeyboard() {
        isShowKeyboard = false
        view.endEditing(true)
    }
}



extension UIViewController {
    
    /// Get name view controller
    var viewControllerName: String {
        return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
}
