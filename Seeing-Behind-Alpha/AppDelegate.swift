//
//  AppDelegate.swift
//  Seeing-Behind-Alpha
//
//  Created by lyjtour on 2/21/18.
//  Copyright © 2018 lyjtour. All rights reserved.
//

import UIKit
import NMSSH


let host_url = "35.3.68.123"
let username = "billy"
let password = "seeingbehind"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var myViewController1: ViewController?
    var myViewController2: ViewControllerII?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*
        var session: NMSSHSession = NMSSHSession (host:host_url, andUsername:username)
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: password)
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sudo motion", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
        print("give Pi time to sudo motion")
        usleep(2000000)
        */
        return true
    }
    
    /*
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        var session: NMSSHSession = NMSSHSession (host:host_url, andUsername:username)
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: password)
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sh ./command.sh", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        var session: NMSSHSession = NMSSHSession (host:host_url, andUsername:username)
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: password)
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sudo motion", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
        
        myViewController1?.reloadCamView()
        myViewController2?.reloadCamView()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        var session: NMSSHSession = NMSSHSession (host:host_url, andUsername:username)
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: password)
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sudo motion", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
        
        myViewController1?.reloadCamView()
        myViewController2?.reloadCamView()
    }
    */

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        var session: NMSSHSession = NMSSHSession (host:host_url, andUsername:username)
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: password)
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sh /home/pi/command.sh", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
        print("App terminate - will kill motion")
    }


}

