//
//  SoundtrackCell.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 06/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class SoundtrackCell: UITableViewCell {
    
    // *** MARK PROPERTIES *** //
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    // *** end *** //
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
