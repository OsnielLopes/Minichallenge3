//
//  AppDelegate.swift
//  MiniChallenge3
//
//  Created by Guilherme Paciulli on 08/06/17.
//  Copyright © 2017 Guilherme Paciulli. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if UIApplication.shared.applicationIconBadgeNumber > 0 {
            UIApplication.shared.applicationIconBadgeNumber = 0
            NotificationController.center.removeAllDeliveredNotifications()
        }
        
        guard let isFirstTimeInApp = UserDefaults.standard.object(forKey: "isFirstTimeInApp") as? Bool else {
            UserDefaults.standard.set(true, forKey: "isFirstTimeInApp")
            
            if let viewControllerDirected = UIStoryboard(name: "InitialPageViewController", bundle: nil).instantiateInitialViewController() {
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.rootViewController = viewControllerDirected
                self.window?.makeKeyAndVisible()
            }
            return true
        }
        if let viewControllerDirected = isFirstTimeInApp ? UIStoryboard(name: "InitialPageViewController", bundle: nil).instantiateInitialViewController() :
                                                           UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = viewControllerDirected
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        NotificationController.center.getDeliveredNotifications { (notifications) in
            
                UIApplication.shared.applicationIconBadgeNumber = notifications.count
            
        }
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        DatabaseController.saveContext()
    }

}

