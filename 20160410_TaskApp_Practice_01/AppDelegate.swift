//
//  AppDelegate.swift
//  20160410_TaskApp_Practice_01
//
//  Created by tlsmooth89 on 4/10/16.
//  Copyright © 2016 yusuke.iwasaki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Asking the user permission of notification.
        let settings = UIUserNotificationSettings(forTypes: [UIUserNotificationType.Alert, UIUserNotificationType.Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        // Verifying if a notification triggered the app start.
        if let notification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
            // Deleting the notification from the notification section.
            application.cancelLocalNotification(notification)
        }
        
        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        // If a notification is triggered when the app is in the foreground.
        if application.applicationState == UIApplicationState.Active {
            // Displaying the alert.
            let alertController = UIAlertController(title: "時間になりました", message: notification.alertBody, preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(defaultAction)
            
            window?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
        } else {
            // If a notification is triggered when the app is in teh background, just print the log.
            print("\(notification.alertBody)")
        }
        
        // Deleting the notification from the notification section.
        application.cancelLocalNotification(notification)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

