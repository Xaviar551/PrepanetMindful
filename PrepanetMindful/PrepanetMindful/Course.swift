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
    var status: String
    var startDate: Date
    var finalDate: Date
    var courseDescription: String
    
    init (id: String, name: String, status: String, startDate: Date, finalDate: Date, courseDescription: String) {
        self.id = id
        self.name = name
        self.status = status
        self.startDate = startDate
        self.finalDate = finalDate
        self.courseDescription = courseDescription
    }
}
