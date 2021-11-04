//
//  Student.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class Student: NSObject {
    var id: String!
    var name: String!
    var campus: String!
    
    init(id: String, name: String, campus: String) {
        self.id = id
        self.name = name
        self.campus = campus
    }
}
