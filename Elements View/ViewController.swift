//
//  ViewController.swift
//  Elements View
//
//  Created by Richard Chiang on 2016-12-26.
//  Copyright © 2016 Richard Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var elements: [Element] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        elements = try! Element.loadElements()
        print(elements)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

