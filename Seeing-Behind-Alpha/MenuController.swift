//
//  MenuController.swift
//  DemoApp
//
//  Created by lyjtour on 2/17/18.
//  Copyright © 2018 Stefano Vettor. All rights reserved.
//

import UIKit
import NMSSH
import MjpegStreamingKit

class MenuController: UIViewController {
    @IBOutlet weak var stitchView: UIImageView!
    @IBOutlet weak var stitchButton: UIButton!
    
    var streamingController1: MjpegStreamingController!
    var streamingController2: MjpegStreamingController!
    
    var stitchImg = UIImage()
    
    var displaylink: CADisplayLink?
    
    //var View1:ViewController!
    //var View2:ViewControllerII!
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        streamingController1 = MjpegStreamingController(imageView: view1)
        streamingController2 = MjpegStreamingController(imageView: view2)
        
        //SwipeAction
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MenutoViews(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(MenutoViews(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        
        
        let url1 = URL(string: "http://"+host_url+":8081")
        streamingController1.contentURL = url1
        let url2 = URL(string: "http://"+host_url+":8082")
        streamingController2.contentURL = url2
        streamingController1.play()
        streamingController2.play()
        //usleep(1000000)
        pressStitch(nil)
        
        //View1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "view1") as! ViewController
        //View2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "view2") as! ViewControllerII
        //View1.reloadCamView()
        //View2.reloadCamView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Terminate stitching display")
        displaylink?.invalidate()
    }
    
    @objc func displayImage(image: UIImage){
        stitchImg = image
    }
    
    @objc func stitch(){
        usleep(100000)
        var images:[UIImage] = []
        
        /*if (myViewController1.streamingController == nil){
         print("update frame")
         }*/
        
        images.append(streamingController1.currentFrame!)
        images.append(streamingController2.currentFrame!)
        //stitchImg = OpenCVWrapper.stitch(withOpenCV: images)
        self.stitchImg = OpenCVWrapper.startTest(streamingController2.currentFrame!, image2: streamingController1.currentFrame!)
        if (self.stitchImg == nil){
            print("nil")
        }
    }
    
    @IBAction func pressStitch(_ sender: Any?) {
        displaylink = CADisplayLink(target: self, selector: #selector(displayStitch))
        displaylink?.add(to: .current, forMode: .defaultRunLoopMode)
        
        //displayStitch();

    }
    
    @objc func displayStitch() {
        usleep(100000)
        var images:[UIImage] = []
        
        /*if (myViewController1.streamingController == nil){
         print("update frame")
         }*/
        
        if (streamingController1.currentFrame == nil || streamingController2.currentFrame == nil){
            print("update frame")
            return
        }
        
        images.append(streamingController1.currentFrame!)
        images.append(streamingController2.currentFrame!)
        //stitchImg = OpenCVWrapper.stitch(withOpenCV: images)
        stitchImg = OpenCVWrapper.startTest(streamingController2.currentFrame!, image2: streamingController1.currentFrame!)
        if (stitchImg == nil){
            print("nil")
        }
        
        DispatchQueue.main.async {
            self.stitchView.image = self.stitchImg
            //self.stitchView.setNeedsDisplay()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func MenutoViews(swipe: UISwipeGestureRecognizer){
        switch swipe.direction.rawValue{
        case 1:
            performSegue(withIdentifier: "MenutoView2", sender: self)
        case 2:
            performSegue(withIdentifier: "MenutoView1", sender: self)
        default:
            break
        }
    }
/*
    @IBAction func turnOnCams(_ sender: AnyObject) {
        ///////////////////////////////////////////////////
        ////                                           ////
        ////              Turn on Cameras              ////
        ////                                           ////
        ///////////////////////////////////////////////////
        var session: NMSSHSession = NMSSHSession (host:"35.0.30.120", andUsername:"pi")
        session.connect()
        if (session.isConnected) {
            session.authenticate(byPassword: "raspberry")
            if (session.isAuthorized) {
                NSLog("Authentication succeeded");
            }
        }
        
        var error: NSError?
        var response: String? = session.channel.execute("sudo motion", error: &error, timeout: nil)
        //NSLog("List of my sites: %@", response)
        //var BOOL success = [session.channel uploadFile:@"~/index.html" to:@"/var/www/9muses.se/"];
        session.disconnect()
        if ifTurnOn {
            turnOnButton.setTitle("Turn off the cameras", for: .normal)
            ifTurnOn = false
        } else {
            turnOnButton.setTitle("Turn on the cameras", for: .normal)
            ifTurnOn = true
        }
    }
*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
