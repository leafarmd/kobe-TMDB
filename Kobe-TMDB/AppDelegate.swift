//
//  AppDelegate.swift
//  Kobe-TMDB
//
//  Created by Rafael Damasceno on 23/07/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    private let navigator = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        makeViewController()
        
        return true
    }
    
    private func makeViewController() {
        let router = UpcomingMoviesRouter(navigator: navigator)
        window.rootViewController = navigator
        window.makeKeyAndVisible()
        window.rootNavigationController?.pushViewController(router.makeViewController(), animated: false)
    }
}

extension UIWindow {
    var rootNavigationController: UINavigationController? {
        return rootViewController as? UINavigationController
    }
}

