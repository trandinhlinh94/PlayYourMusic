//
//  SoundtrackDetailVC.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 07/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit
import AVFoundation

protocol SoundTrackDetailVCDelegate {
    func getNext() -> Soundtrack
    func getPrev() -> Soundtrack
}

class SoundtrackDetailVC: UIViewController {
    // *** MARK PROPERTIES *** //
    @IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var delegate : SoundTrackDetailVCDelegate?
    var soundtrack : Soundtrack!
    
    var isPlaying :Bool = false
    var player : AVPlayer?
    // *** end *** //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    func load () {
        let imagedata = NSData(contentsOfURL: NSURL(string: soundtrack.artworkUrl)!)
        if let tmpdata = imagedata {
            bkImageView.image = UIImage(data: tmpdata)
            posterImageView.image = UIImage(data: tmpdata)
        }
        
        player = AVPlayer(URL: NSURL(string: soundtrack.previewUrl)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(sender: AnyObject) {
        isPlaying = !isPlaying
        
        if (isPlaying) {
            self.playButton.setImage(UIImage(named: "paused"), forState: UIControlState.Normal)
            player?.play()
        } else {
            self.playButton.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
            player?.pause()
        }
    }
    
    @IBAction func prev(sender: AnyObject) {
        self.soundtrack = delegate?.getPrev()
        load()
        if(isPlaying){
            self.player?.play()
        }
    }
    
    @IBAction func next(sender: AnyObject) {
        self.soundtrack = delegate?.getNext()
        load()
        if(isPlaying) {
            self.player?.play()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
