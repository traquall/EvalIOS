//
//  Contact.swift
//  test3
//
//  Created by stagiaire on 03/05/2017.
//  Copyright © 2017 stagiaire. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    
    var id: Int
    var name: String
    var weight: String
    var height: String
    var element: String
    
    init(id: Int, name: String, weight: String = "", height: String = "", element: String = "") {
        self.id = id
        self.name = name
        self.weight = weight
        self.height = height
        self.element = element
    }

    
}
