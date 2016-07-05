//
//  ViewController.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SoundtrackGetterDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let soundtrack = SoundtrackGetter(delegate: self)
        soundtrack.getSoundtrack()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didGetSoundTracks(soundTracks: [Soundtrack]) {
        print("Track title:\n\(soundTracks[0].trackName)")
    }
    
    func didNotGetSoundTracks(error: NSError) {
        print("didNotGetSoundTrack error: \(error)")
    }
}

