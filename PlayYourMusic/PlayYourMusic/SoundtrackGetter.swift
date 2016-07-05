//
//  SoundtrackManager.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import Foundation

class SoundtrackGetter {
    
    var soundTracks: [Soundtrack] = []
    
    func getSoundtrack() {
        // create a networking task with shared session
        let session = NSURLSession.sharedSession()
        
        // construct the URL to fetch data
        let soundtrackURL = NSURL(string: "https://itunes.apple.com/search?term=one%20republic")
        
        // getting data from api into datatask
        // NSSessionDataTask is used for downloading data from server to memory
        let dataTask = session.dataTaskWithURL(soundtrackURL!) {
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
                        print(soundtrack.trackName)
                    }
                    
                    //print("Track title:\(self.soundTracks[0][8])")
                    //print(self.soundTracks)
                    
                } catch let jsonError as NSError {
                    // throw error if conversion process encounters error
                    print("JSON error description: \(jsonError.description)")
                }
            }
        }
        // the task is ready. fire it up 
        dataTask.resume()
        
    }
}