//
//  ViewUtils.swift
//  PrepanetMindful
//
//  Created by user208146 on 11/16/21.
//

import Foundation


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

var courses = [
    Course(id: "1", name: "Liderazgo Positivo y Transformación Personal", status: "Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "En este taller aprenderás sobre cómo ser un líder y saber distinguir tus mejores cualidades."),
    Course(id: "2", name: "Mis habilidades y motivaciones", status: "No Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "Prepárate para conocerte mejor a ti mismo, lo que eres capaz de hacer así como lo que te motiva."),
    Course(id: "3", name: "Mis emociones", status: "Cursando", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
    Course(id: "4", name: "Mis relaciones", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
    Course(id: "5", name: "Mis áreas de oportunidad", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
    Course(id: "6", name: "Mis metas", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem")
]

var students = [
    Student(id:"A07045937" , name: "Fernanada Gonzalez Jimenez" , campus: "CSF"),
    Student(id:"A07045938" , name: "Johan Gadiel Garcia Marin", campus: "CSF"),
    Student(id:"A07045939" , name: "Abishai Enrique Del Castillo Vega", campus: "CSF"),
    Student(id:"A07045940" , name: "Daniela Cristal Lorenzo Blas", campus: "PUE"),
    Student(id:"A07045941" , name: "Abril Estefania Tun Kun", campus: "PUE"),
    Student(id:"A07045942" , name: "Edgar Leonardo Nuñez Garcia" , campus: "PUE"),
    Student(id:"A07045943" , name: "Nathali Guzman Santos", campus: "PUE"),
]
