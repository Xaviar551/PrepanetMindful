//
//  Taller.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 03/11/21.
//

import UIKit

class Course: NSObject {
    var id: String
    var name: String
    var  courseDescription: String
    
    init (id: String, name: String,  courseDescription: String) {
        self.id = id
        self.name = name
        self.courseDescription = courseDescription
    }
}
