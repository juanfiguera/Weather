//
//  ViewController.swift
//  What's The Weather
//
//  Created by Juan Figuera on 10/18/14.
//  Copyright (c) 2014 Central Park Labs, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var city: UITextField!

    @IBAction func buttonPressed(sender: AnyObject) {
    
       var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        
        var url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
    }
    
    @IBOutlet var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

