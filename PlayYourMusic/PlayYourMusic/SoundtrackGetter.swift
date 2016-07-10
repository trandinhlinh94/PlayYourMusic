//
//  SoundtrackManager.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import Foundation

// The delegate's didNotGetTrack method is called if either :
// - The track was not acquired from the iTunes search API
// - The received track data could not be converted from JSON into a dictionary

protocol SoundtrackGetterDelegate {
    func didGetSoundTracks(soundTracks: [Soundtrack])
    func didNotGetSoundTracks(error: NSError)
}

class SoundtrackGetter {
    
    private var delegate : SoundtrackGetterDelegate
    
    init(delegate: SoundtrackGetterDelegate) {
        self.delegate = delegate
    }
    
    var soundTracks: [Soundtrack] = []
    
    func getSoundtrack(searchedTerm: String) {
        // create a networking task with shared session
        let session = NSURLSession.sharedSession()
        
        // construct the URL to fetch data
//        let soundtrackURL = NSURL(string: "https://itunes.apple.com/search?term=one%20republic")
        let soundtrackURL = NSURL(string: "https://itunes.apple.com/search?term=\(searchedTerm)")!
        
        // getting data from api into datatask
        // NSSessionDataTask is used for downloading data from server to memory
        let dataTask = session.dataTaskWithURL(soundtrackURL) {
            // the completion handler is executed only when the task is finished requesting and retrieving data from server
            (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let error = error {
                // if error appears throw error message when trying to get data from server
                print("Error:\n\(error)")
            }else {
                //                let dataString = String(data: data!, encoding: NSUTF8StringEncoding)
                //                print("Human-readable data:\n\(dataString!)")
                // if it is successful, server sends response
                // convert JSON data into Swift objects (dictionary type) using NSJSONSerialization and JSONObjectWithData
                do {
                    let soundtrackData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [String: AnyObject]
                    //                    print(soundtrackData)
                    
                    for entry in soundtrackData["results"] as! [NSDictionary] {
                        let soundtrack = Soundtrack(data: entry as! [String : AnyObject])
                        self.soundTracks.append(soundtrack)
                    }
                    //print(self.soundTracks[0].trackName)
                    
                    //notify changes to the delegate
                    self.delegate.didGetSoundTracks(self.soundTracks)
                    
                } catch let jsonError as NSError {
                    // throw error if conversion process encounters error
                    //print("JSON error description: \(jsonError.description)")
                    self.delegate.didNotGetSoundTracks(jsonError)
                }
            }
        }
        // the task is ready. fire it up
        dataTask.resume()
        
    }
}