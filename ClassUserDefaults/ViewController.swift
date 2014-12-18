//
//  ViewController.swift
//  ClassUserDefaults
//
//  Created by Andrew Seeley on 18/12/2014.
//  Copyright (c) 2014 Seemu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Save(sender: UIButton) {
        var t = truck(pName: "Bob", pnoWheels: 6, pcolour: "Red")
        
        let encodedName = NSKeyedArchiver.archivedDataWithRootObject(t.Name)
        let encodednoWheels = NSKeyedArchiver.archivedDataWithRootObject(t.noWheels)
        let encodedColour = NSKeyedArchiver.archivedDataWithRootObject(t.colour)
        
        var encodedArray: [NSData] = [encodedName, encodednoWheels, encodedColour]
        
        userDefaults.setObject(encodedArray, forKey: "truckItem")
        userDefaults.synchronize()
        
        println("saved")
        
    }

    @IBAction func Load(sender: UIButton) {
        var truckDataEncoded: [NSData] = userDefaults.objectForKey("truckItem") as [NSData]
        
        var unpackedName: String = NSKeyedUnarchiver.unarchiveObjectWithData(truckDataEncoded[0] as NSData) as String
        var unpackednoWheels: Int = NSKeyedUnarchiver.unarchiveObjectWithData(truckDataEncoded[1] as NSData) as Int
        var unpackedColour: String = NSKeyedUnarchiver.unarchiveObjectWithData(truckDataEncoded[2] as NSData) as String
        
        var t = truck(pName: unpackedName, pnoWheels: unpackednoWheels, pcolour: unpackedColour)
        
        println(t.Name)
        println(t.noWheels)
        println(t.colour)
        
    }
}

