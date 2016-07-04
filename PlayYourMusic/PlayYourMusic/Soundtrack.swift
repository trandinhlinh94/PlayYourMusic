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
    
    init(data : NSDictionary) {
        trackName = data["trackName"] as! String
        artistName = data["artistName"] as! String
        previewUrl = data["previewUrl"] as! String
        artworkUrl = (data["artworkUrl100"] as! String).stringByReplacingOccurrencesOfString("100x100", withString: "640x480")
        thumbnail = data["artworkUrl100"] as! String
    }
}