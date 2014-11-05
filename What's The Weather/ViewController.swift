//
//  ViewController.swift
//  What's The Weather
//
//  Created by Juan Figuera on 10/18/14.
//  Copyright (c) 2014 Central Park Labs, LLC. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var city: UITextField!
    @IBOutlet var message: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
    
       self.view.endEditing(true)
        
       var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            // checks if city exists
            if (urlContent!.localizedCaseInsensitiveContainsString("<span class=\"phrase\">")) {
            
                var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
            
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
                
                // async content display
                dispatch_async(dispatch_get_main_queue()){
                
                    self.message.text = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
                }
            
            } else {
                
                // async content display
                dispatch_async(dispatch_get_main_queue()){
                    self.message.text = "Couldn't find that city - please try again"
                }
                
            }
        }
        
        task.resume()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

