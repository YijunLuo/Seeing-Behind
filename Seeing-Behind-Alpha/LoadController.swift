//
//  LoadController.swift
//  Seeing-Behind-Alpha
//
//  Created by lyjtour on 4/1/18.
//  Copyright © 2018 lyjtour. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadController: UIViewController{
    
    
    //@IBOutlet weak var indicator: NVActivityIndicatorView!
    //@IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //Loading Animation
        
        let frame = CGRect(x: 107, y: 249, width: 128, height: 128)
        let indicator = NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType(rawValue: 12)!)
        indicator.color = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
        view.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        indicator.startAnimating()
        print(indicator.isAnimating)

        DispatchQueue.main.async {
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
            print("done with starting")
            indicator.stopAnimating()
        
            self.performSegue(withIdentifier: "autoShowMenu", sender: self)
        }
        print("jump")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
