//
//  AppDelegate.swift
//  PlayPortalAuthentication
//
//  Created by Lincoln Fraley on 11/7/18.
//  Copyright © 2018 Lincoln Fraley. All rights reserved.
//

import UIKit
import PPSDK_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PlayPortalLoginDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PlayPortalAuth.shared.configure(forEnvironment: env, withClientId: clientId, andClientSecret: clientSecret, andRedirectURI: redirect)
        authenticate()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        PlayPortalAuth.shared.open(url: url)
        return true
    }
    
    func didLogoutSuccessfully() {
        authenticate()
    }
    
    func authenticate() {
        PlayPortalAuth.shared.isAuthenticated(loginDelegate: self) { error, userProfile in
            if let userProfile = userProfile {
                guard let navigation = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigation") as? UINavigationController
                    , let profile = navigation.viewControllers[0] as? ProfileViewController
                    else {
                        return
                }
                profile.userProfile = userProfile
                self.window?.rootViewController = navigation
            } else if let error = error {
                print("An error occurred during authentication: \(error)")
            } else if userProfile == nil {
                guard let login = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login") as? LoginViewController else {
                    return
                }
                self.window?.rootViewController = login
            }
        }
    }
}

