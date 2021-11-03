//
//  Taller.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 03/11/21.
//

import UIKit

class Taller: NSObject {
    var id: String
    var nombre: String
    var descripcion: String
    
    init (id: String, nombre: String, descripcion: String) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
    }
}
