//
//  LoginViewController.swift
//  PlayPortalAuthentication
//
//  Created by Lincoln Fraley on 11/7/18.
//  Copyright © 2018 Lincoln Fraley. All rights reserved.
//

import Foundation
import UIKit
import PPSDK_Swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = PlayPortalLoginButton(from: self)
        loginButton.center = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height / 2)
        loginView.addSubview(loginButton)
    }
}
