//
//  SoundtrackDetailVC.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 07/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class SoundtrackDetailVC: UIViewController {
    // MARK PROPERTIES
    @IBOutlet weak var bkImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var prev: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
