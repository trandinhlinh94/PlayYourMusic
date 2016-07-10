//
//  SearchViewController.swift
//  PlayYourMusic
//
//  Created by Linh Tran on 10/07/16.
//  Copyright © 2016 Linh Tran. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.placeholder = "enter artist you want to search"
        searchTextField.delegate = self
        searchTextField.enablesReturnKeyAutomatically = true
        searchButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK BUTTON "search" action
    @IBAction func getSearchedArtistButtonTapped(sender: AnyObject) {
        let text = searchTextField.text
        if text!.isEmpty {
            return
        } else {
            searchTextField.text = text!.urlEncoded
            print(text!)
        }
    }
    
    // MARK UITextFieldDelegate and its methods
    
    // Enable the "Search" button
    // if the search text field contains any text,
    // disable it otherwise.
    func textField(textField: UITextField,
                   shouldChangeCharactersInRange range: NSRange,
                                                 replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(
            range,
            withString: string)
        searchButton.enabled = prospectiveText.characters.count > 0
        print("Count: \(prospectiveText.characters.count)")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        getSearchedArtistButtonTapped(searchButton)
        return true
    }

    
    // Tapping on the view should dismiss the keyboard.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "listView") {
            let text = searchTextField.text
            let lvc = segue.destinationViewController as! ListViewController
            lvc.searchedTerm = text!
        }
    }

    

}
extension String {
    
    // A method for %-encoding strings containing spaces and other
    // characters that need to be converted for use in URLs.
    var urlEncoded: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLUserAllowedCharacterSet())!
    }
    
}