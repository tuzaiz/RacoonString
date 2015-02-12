//
//  ViewController.swift
//  DemoRacoonString
//
//  Created by Henry Tseng on 2015/2/12.
//  Copyright (c) 2015年 Cloudbay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var string = "Hello RacoonString. :)"
        
        println(string.length())
        println(string.match("Racoon"))
        if let regex = "(Rac)oon".regex() {
            println(string.match(regex))
        }
        println(string[1..<3])
        println(string.splitBy(" "))
        println(string.sub(" ", ","))
        println(string.sub(0..<5, "Hi"))
        
        var str = "   Hello RacoonString. :) "
        println(str.trim())
        
        var htmlStr = "<a href=\"#\">Link</a>"
        var escapedStr = str.escape()
        println(escapedStr)
        println(escapedStr?.unescape())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

