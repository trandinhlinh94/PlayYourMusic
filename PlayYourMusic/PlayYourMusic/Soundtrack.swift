//
//  Soundtrack.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 04/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import Foundation

class Soundtrack {
    
    var trackName  : String
    var artistName : String
    var previewUrl : String
    var artworkUrl : String
    var thumbnail  : String
    
    init(data : [String: AnyObject]) {
        self.artistName = data["artistName"] as! String
        self.trackName = data["trackName"] as! String
        self.previewUrl = data["previewUrl"] as! String
        self.artworkUrl = (data["artworkUrl100"] as! String).stringByReplacingOccurrencesOfString("100x100", withString: "640x480")
        self.thumbnail = data["artworkUrl100"] as! String
    }
    
}