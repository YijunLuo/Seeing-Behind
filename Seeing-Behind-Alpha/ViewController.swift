//
//  ViewController.swift
//  DemoApp
//
//  Created by Stefano Vettor on 28/03/16.
//  Copyright © 2016 Stefano Vettor. All rights reserved.
//

import UIKit
import MjpegStreamingKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var streamingController1: MjpegStreamingController!
    
    var url: URL?
    
    var playing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let testimg = UIImage(named: ("lena.png"))
        //self.testView.image = testimg
        
        /*
        let tap = UITapGestureRecognizer(target: self, action: #selector(playAndStop(tapGestureRecognizer:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
 */
        
        //test opencv
        print("\(OpenCVWrapper.openCVVersionString())")
        self.reloadCamView()
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myViewController1 = self
        
        
    }
    
    
    func reloadCamView() {
        streamingController1 = MjpegStreamingController(imageView: imageView)
        streamingController1.didStartLoading = { [unowned self] in
            self.loadingIndicator.startAnimating()
        }
        streamingController1.didFinishLoading = { [unowned self] in
            self.loadingIndicator.stopAnimating()
        }
        
        url = URL(string: "http://"+host_url+":8081")
        streamingController1.contentURL = url
        
        //playButton.setTitle("Stop", for: .normal)
        streamingController1.play()
        playing = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Terminate cam1 display")
        streamingController1.stop()
        playing = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func play(_ sender: UITapGestureRecognizer) {
        if playing {
            //playButton.setTitle("Play", for: .normal)
            streamingController1.stop()
            playing = false
        } else {
            
            streamingController1.play()
            playing = true
            
            //testView.image = streamingController1.currentFrame
            
            //playButton.setTitle("Stop", for: .normal)
        }
    }
    /*
    @objc func playAndStop(tapGestureRecognizer: UITapGestureRecognizer) {
        if playing {
            //playButton.setTitle("Play", for: .normal)
            streamingController1.stop()
            playing = false
        } else {
            
            streamingController1.play()
            playing = true
            
            //testView.image = streamingController1.currentFrame
            
            //playButton.setTitle("Stop", for: .normal)
        }
    }*/
    
    /*
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "segue", sender: self)
    }
 */
    
    
}


