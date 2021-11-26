//
//  PrepanetMindfulModel.swift
//  PrepanetMindful
//
//  Created by user197920 on 11/2/21.
//

import UIKit
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class PrepanetMindfulModel: NSObject {
    private static var signedInUser: User!
    
    override init() {
        PrepanetMindfulModel.signedInUser=User()
    }
    func getUser() ->User {
        return PrepanetMindfulModel.signedInUser
        
    }
    
    func obtenerInformacionDeCursosUsuarioActual(_ callbackFunction:@escaping (([Course]) ->  Void)) {
        obtenerInformacionDeCursosUsuario(uidUsuario: PrepanetMindfulModel.signedInUser.uid, callbackFunction)
    }
    func obtenerInformacionDeCursosUsuario(uidUsuario: String, _ callbackFunction:@escaping (([Course]) ->  Void)){
        var listaCursos:[Course] = []
        
        let db = Firestore.firestore()
        let docRefTalleres = db.collection("talleres").getDocuments(){(querySnap, err) in
            var courses: [Course]=[]
            var count=0
            for doc in querySnap!.documents{
                //print(doc.data())
                /*self.courses[count].name=doc.data()["name"] as! String
                 self.courses[count].courseDescription=doc.data()["description"] as! String
                 self.tableView.reloadData()*/
                let course=Course()
                course.name=doc.data()["name"] as! String
                course.courseDescription=doc.data()["description"] as! String
                course.status="NA"
                course.id=doc.documentID
                courses.append(course)
            }
            let refInscripciones = db.collection("inscripcion").whereField("usuario",isEqualTo: uidUsuario).getDocuments() {(querySnap2, err) in
                var enrollments: [Enrollment]=[]
                for doc in querySnap2!.documents{
                    let enrollment=Enrollment()
                    enrollment.estatus=doc.data()["estatus"] as! String
                    enrollment.taller=doc.data()["oferta_taller"] as! String
                    enrollments.append(enrollment)
                }
                print(enrollments.count)
                let coursesWithState = courses.map({ (course) -> Course in
                    let filteredEnrollment=enrollments.filter({ return $0.taller==course.id })
                    if(filteredEnrollment.isEmpty){
                        return course
                    }
                    else{
                        let newCourse=course
                        newCourse.status=filteredEnrollment[0].estatus
                        return newCourse
                    }
                })
                
                
                // result function call
                callbackFunction(coursesWithState)
            }
        }
    }
    func iniciarSesion(usuario: String, contrasena: String, _ callbackFunction:@escaping (() ->  Void), _ errorCallback:@escaping (()->Void) = {}) {
        Auth.auth().signIn(withEmail: usuario, password: contrasena, completion: { (authResult, error) ->  Void in
            guard let auth = authResult else{
                PrepanetMindfulModel.signedInUser.uid="error"
                errorCallback()
                return
            }
            PrepanetMindfulModel.signedInUser.uid=auth.user.uid
            let db = Firestore.firestore()
            let refInscripciones = db.collection("usuario").whereField("uid",isEqualTo: PrepanetMindfulModel.signedInUser.uid).getDocuments() {(querySnap, err) in
                guard let snap=querySnap else{
                    PrepanetMindfulModel.signedInUser.uid="error"
                    errorCallback()
                    return
                }
                PrepanetMindfulModel.signedInUser.nombre=snap.documents[0].data()["nombre_completo"] as! String
                PrepanetMindfulModel.signedInUser.matriculaONomina=snap.documents[0].data()["matricula_o_nomina"] as! String
                PrepanetMindfulModel.signedInUser.credenciales=snap.documents[0].data()["credenciales"] as! Int
                callbackFunction()
            }
            
        })
    }
    func shouldRegister(cursos: [Course], index: Int) -> Bool{
        if index==0{
            return true
        }
        if cursos[index].status=="NA" && cursos[index-1].status=="A"{
            return true
        }
        return false
    }
    func registrarInscripcion(curso: String){
        let db = Firestore.firestore()
        let refInscripciones = db.collection("inscripcion").getDocuments(){
            (querySnap, err) in
            guard let snap=querySnap else{
                return
            }
            let inscripcionesCount=querySnap!.count
            db.collection("inscripcion").addDocument(data: [
                "estatus": "I",
                "oferta_taller": curso,
                "timestamp": Timestamp(),
                "usuario": PrepanetMindfulModel.signedInUser.uid
            ])
        }
    }
    func periodoActual()->[Date]{
        let calendar = Calendar.current
        let components=calendar.dateComponents([.month,.year], from: Date())
        if components.month!<7 {
            var dateComponents1 = DateComponents()
            dateComponents1.year = components.year!
            dateComponents1.month = 1
            dateComponents1.day = 1
            dateComponents1.timeZone = TimeZone(abbreviation: "CST")
            dateComponents1.hour = 0
            dateComponents1.minute = 0
            var dateComponents2 = DateComponents()
            dateComponents2.year = components.year!
            dateComponents2.month = 6
            dateComponents2.day = 30
            dateComponents2.timeZone = TimeZone(abbreviation: "CST")
            dateComponents2.hour = 21
            dateComponents2.minute = 59
            return [calendar.date(from: dateComponents1)!, calendar.date(from: dateComponents2)!]
        }
        var dateComponents1 = DateComponents()
        dateComponents1.year = components.year!
        dateComponents1.month = 7
        dateComponents1.day = 1
        dateComponents1.timeZone = TimeZone(abbreviation: "CST")
        dateComponents1.hour = 0
        dateComponents1.minute = 0
        var dateComponents2 = DateComponents()
        dateComponents2.year = components.year!
        dateComponents2.month = 12
        dateComponents2.day = 31
        dateComponents2.timeZone = TimeZone(abbreviation: "CST")
        dateComponents2.hour = 21
        dateComponents2.minute = 59
        return [Calendar.current.date(from: dateComponents1)!, Calendar.current.date(from: dateComponents2)!]
    }
    func obtenerListaDeAlumnos(curso: Int, campus: String,_ callbackFunction:@escaping (([Student]) ->  Void)){
        let db = Firestore.firestore()
        let refAlumnos=db.collection("usuarios").whereField("credenciales", isEqualTo: "1").whereField(campus, isEqualTo:campus).getDocuments(){
            (qsnap, err) in
            guard let snap=qsnap else{
                return
            }
            var alumnos: [String : Student]=[:]
            for doc in snap.documents{
                let alumno=Student()
                let usr=User()
                usr.uid=snap.documents[0].data()["uid"] as! String
                usr.nombre=snap.documents[0].data()["nombre_completo"] as! String
                usr.matriculaONomina=snap.documents[0].data()["matricula_o_nomina"] as! String
                usr.credenciales=snap.documents[0].data()["credenciales"] as! Int
                alumno.user=usr
                alumno.currentCourse=0
                alumnos[usr.uid]=alumno
            }
            let refInscripciones=db.collection("inscripciones").getDocuments(){
                (qsnap2, err2) in
                guard let snap2=qsnap2 else{
                    return
                }
                for doc in snap2.documents{
                    if(doc.data()["estatus"] as! String == "A"){
                        alumnos[doc.data()["uid"] as! String]?.currentCourse+=1
                    }
                }
                var listaAlumnos: [Student]=[]
                for (k,alumno) in alumnos{
                    listaAlumnos.append(alumno)
                }
                let filtered=listaAlumnos.filter({
                    return $0.currentCourse==curso
                })
                callbackFunction(filtered)
                
            }
        }
    }
}
class User{
    var nombre: String!
    var matriculaONomina: String!
    var credenciales: Int!
    var uid: String!
}
class Student{
    var user: User!
    var currentCourse: Int!
}
class Course: NSObject {
    var id: String
    var name: String
    var status: String
    var startDate: Date
    var finalDate: Date
    var courseDescription: String
    override init(){
        id=""
        name=""
        status=""
        startDate=Date()
        finalDate=Date()
        courseDescription=""
    }
    init (id: String, name: String, status: String, startDate: Date, finalDate: Date, courseDescription: String) {
        self.id = id
        self.name = name
        self.status = status
        self.startDate = startDate
        self.finalDate = finalDate
        self.courseDescription = courseDescription
    }
}

class Enrollment{
    var estatus: String!
    var taller: String!
}
