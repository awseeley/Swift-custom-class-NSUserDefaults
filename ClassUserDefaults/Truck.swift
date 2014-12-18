//
//  Truck.swift
//  ClassUserDefaults
//
//  Created by Andrew Seeley on 18/12/2014.
//  Copyright (c) 2014 Seemu. All rights reserved.
//

import Foundation

class truck {
    var Name = String()
    var noWheels = Int()
    var colour = String()
    
    init(pName: String, pnoWheels: Int, pcolour: String) {
        Name = pName
        noWheels = pnoWheels
        colour = pcolour
    }
    
    // We need this to save & load data form NSUserDefaults
    
    init(coder aDecoder: NSCoder!) {
        self.Name = aDecoder.decodeObjectForKey("Name") as String
        self.noWheels = aDecoder.decodeObjectForKey("noWheels") as Int
        self.colour = aDecoder.decodeObjectForKey("colour") as String
    }
    
    func initWithCoder(aDecoder: NSCoder) -> truck {
        self.Name = aDecoder.decodeObjectForKey("Name") as String
        self.noWheels = aDecoder.decodeObjectForKey("noWheels") as Int
        self.colour = aDecoder.decodeObjectForKey("colour") as String
        return self
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(Name, forKey: "Name")
        aCoder.encodeObject(noWheels, forKey: "noWheels")
        aCoder.encodeObject(colour, forKey: "colour")
    }
    
    
}