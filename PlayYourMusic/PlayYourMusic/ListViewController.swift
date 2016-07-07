//
//  ViewController.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, SoundtrackGetterDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // MARK PROPERTIES
    @IBOutlet weak var tableView: UITableView!
    var soundTracks :[Soundtrack] = []
    var soundtrackGetter : SoundtrackGetter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        soundtrackGetter = SoundtrackGetter(delegate: self)
        soundtrackGetter.getSoundtrack()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.reloadData()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //        print("Track title:\n\(soundTracks[0].trackName)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didGetSoundTracks(soundtracks: [Soundtrack]) {
        self.soundTracks = soundtracks
        self.tableView.reloadData()
        //        print("Track title:\n\(self.soundTracks[0].trackName)")
        
    }
    
    func didNotGetSoundTracks(error: NSError) {
        print("didNotGetSoundTrack error: \(error)")
    }
    
    // customize the table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(soundTracks.count)")
        return self.soundTracks.count
    }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
            let cellIdentifier = "soundtrackCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SoundtrackCell
            cell.posterImage.image = nil
            let soundtrack = self.soundTracks[indexPath.row]
            let imagedata = NSData(contentsOfURL: NSURL(string: soundtrack.thumbnail)!)
            if let tmpdata = imagedata {
                cell.posterImage.image = UIImage(data: tmpdata)
            }
            cell.artistName.text = soundtrack.artistName
            cell.trackName.text = soundtrack.trackName
            return cell
        }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "soundtrackCell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SoundtrackCell
//        let track = soundTracks[indexPath.row]
//        cell.artistName.text = track.artistName
//        cell.trackName.text = track.trackName
//        
//        return cell
//    }
    
    
    
}