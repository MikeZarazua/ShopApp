//
//  AppDelegate.swift
//  ShopApp
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Since I don't now wich iOS version you are runing so a set the target in order to support since iOS 10
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Enable IQKeyboard
        IQKeyboardManager.shared.enable      = true
        // Override point for customization after application launch.
        self.window                          = UIWindow(frame: UIScreen.main.bounds)
        //let initialVC = TabBarControllerMarket.instiantate()
        let initialVC                        = InitialMarketViewController.instiantate()
        let navigationController             = UINavigationController(rootViewController: initialVC)
        window?.rootViewController           = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //disable
        IQKeyboardManager.shared.enable = false
    }

    // MARK: UISceneSession Lifecycle, With @available(iOS 13.0, *) in order to avoid conflicts
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

