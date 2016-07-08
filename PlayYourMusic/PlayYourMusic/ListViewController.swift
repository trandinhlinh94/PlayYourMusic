//
//  ViewController.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, SoundtrackGetterDelegate, SoundTrackDetailVCDelegate, UITableViewDataSource, UITableViewDelegate {
    
    // *** MARK PROPERTIES *** //
    @IBOutlet weak var tableView: UITableView!
    var soundTracks :[Soundtrack] = []
    var soundtrackGetter : SoundtrackGetter!
    var index = 0
    // *** end *** //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soundtrackGetter = SoundtrackGetter(delegate: self)
        soundtrackGetter.getSoundtrack()
        
        // set the delegate and datasource of tableView to be itself to watch for the changes
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
    
    
    // *** implement the SoundtrackGetterDelegate protocol's methods *** //
    
    func didGetSoundTracks(soundtracks: [Soundtrack]) {
        // passing the data from protocol to the variable that will hold all the soundtrack records
        // and we will use this variable to access and display data in the tableView
        self.soundTracks = soundtracks
        self.tableView.reloadData()
        //        print("Track title:\n\(self.soundTracks[0].trackName)")
        
    }
    
    func didNotGetSoundTracks(error: NSError) {
        print("didNotGetSoundTrack error: \(error)")
    }
    // *** end *** //
    
    
    //*** implement the table view methods which will constuct table view *** //
    
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
    // *** end *** //
    
    // *** implement method prepareForSegue when user taps in a single cell, view will direct to the SoundtrackDetailView   *** //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detail") {
            let indexpath = self.tableView.indexPathForCell(sender as! SoundtrackCell)
            let tmpTrack = self.soundTracks[indexpath!.row]
            print(tmpTrack.thumbnail)
            print(tmpTrack.artworkUrl)
            index = indexpath!.row
            let dvc = segue.destinationViewController as! SoundtrackDetailVC
            dvc.delegate = self
            dvc.soundtrack = tmpTrack
        }
    }
    
    func getNext() -> Soundtrack {
        index += 1
        if (index >= self.soundTracks.count) {
            index = 0
        }
        print("Get Next")
        return self.soundTracks[index]
    }
    
    func getPrev() -> Soundtrack {
    index -= 1;
        if(index != 0){
            index = self.soundTracks.count - 1
        }
    print("Get Prev")
    return self.soundTracks[index]
    }
    
}