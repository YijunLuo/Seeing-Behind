//
//  ViewControllerII.swift
//  DemoApp
//
//  Created by lyjtour on 2/17/18.
//  Copyright © 2018 Stefano Vettor. All rights reserved.
//

import UIKit
import MjpegStreamingKit

class ViewControllerII: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var streamingController2: MjpegStreamingController!
    
    //@IBOutlet weak var playButton: UIButton!
    
    var url: URL?
    
    var playing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let tap = UITapGestureRecognizer(target: self, action: #selector(playAndStop(tapGestureRecognizer:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
 */
        
        self.reloadCamView()
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.myViewController2 = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Terminate cam2 display")
        streamingController2.stop()
        playing = false
    }
    
    func reloadCamView() {
        streamingController2 = MjpegStreamingController(imageView: imageView)
        streamingController2.didStartLoading = { [unowned self] in
            self.loadingIndicator.startAnimating()
        }
        streamingController2.didFinishLoading = { [unowned self] in
            self.loadingIndicator.stopAnimating()
        }
        
        url = URL(string: "http://"+host_url+":8082")
        streamingController2.contentURL = url
        
        //playButton.setTitle("Stop", for: .normal)
        streamingController2.play()
        playing = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(_ sender: UITapGestureRecognizer) {
        if playing {
            //playButton.setTitle("Play", for: .normal)
            streamingController2.stop()
            playing = false
        } else {
            
            streamingController2.play()
            playing = true
            //playButton.setTitle("Stop", for: .normal)
        }
    }
    
    /*
    @objc func playAndStop(tapGestureRecognizer: UITapGestureRecognizer) {
        if playing {
            //playButton.setTitle("Play", for: .normal)
            streamingController2.stop()
            playing = false
        } else {
            
            streamingController2.play()
            playing = true
            //playButton.setTitle("Stop", for: .normal)
        }
    }*/
    
    /*
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "segueII", sender: self)
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
