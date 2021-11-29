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
    private static var persistentCourseList: [Course]!
    
    override init() {
        if(PrepanetMindfulModel.signedInUser==nil){
            PrepanetMindfulModel.signedInUser=User()
        }
    }
    func getUser() ->User {
        return PrepanetMindfulModel.signedInUser
        
    }
    
    func obtenerInformacionDeCursosUsuarioActual(_ callbackFunction:@escaping (([Course]) ->  Void)) {
        obtenerInformacionDeCursosUsuario(uidUsuario: getUser().uid, callbackFunction)
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
                course.status="P"
                course.id=doc.documentID
                courses.append(course)
            }
            PrepanetMindfulModel.persistentCourseList=courses
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
    func iniciarSesion(usuario: String, contrasena: String, _ callbackFunction:@escaping ((String) ->  Void), _ errorCallback:@escaping (()->Void) = {}) {
        Auth.auth().signIn(withEmail: usuario, password: contrasena, completion: { (authResult, error) ->  Void in
            guard let auth = authResult else{
                PrepanetMindfulModel.signedInUser.uid="error"
                errorCallback()
                return
            }
            PrepanetMindfulModel.signedInUser.uid=auth.user.uid
            let db = Firestore.firestore()
            let refInscripciones = db.collection("usuarios").whereField("uid",isEqualTo: PrepanetMindfulModel.signedInUser.uid).getDocuments() {(querySnap, err) in
                guard let snap=querySnap else{
                    PrepanetMindfulModel.signedInUser.uid="error"
                    errorCallback()
                    return
                }
                PrepanetMindfulModel.signedInUser.nombre=snap.documents[0].data()["nombre_completo"] as! String
                PrepanetMindfulModel.signedInUser.matriculaONomina=snap.documents[0].data()["matricula_o_nomina"] as! String
                PrepanetMindfulModel.signedInUser.credenciales=snap.documents[0].data()["credenciales"] as! Int
                callbackFunction(PrepanetMindfulModel.signedInUser.credenciales == 2 ? "admin" : "no-admin")
                
            }
            
        })
    }
    func openEnrollment(_ resultCallback:@escaping ((Bool)->Void)){
        let db=Firestore.firestore()
        let refFechasIscripciones = db.collection("fechas_de_inscripcion").getDocuments(){
            (querySnap, err) in
            guard let snap=querySnap else{
                return
            }
            var result=false
            for doc in snap.documents{
                let now=Date()
                let start=doc.data()["start"] as! Timestamp
                let end=doc.data()["end"] as! Timestamp
                if now>=start.dateValue() && now<end.dateValue(){
                    result=true
                    break
                }
                
            }
            resultCallback(result)
        }
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
    func obtenerListaDeAlumnos(curso: Int, campus: String,_ callbackFunction:@escaping (([StudentCourse]) ->  Void)){
        let db = Firestore.firestore()
        let refAlumnos=db.collection("usuarios").whereField("credenciales", isEqualTo: 1).whereField("campus", isEqualTo: campus).getDocuments(){
            (qsnap, err) in
            guard let snap=qsnap else{
                return
            }
            var alumnos: [String : StudentCourse]=[:]
            for doc in snap.documents{
                let alumno=StudentCourse()
                let student=Student()
                student.name=snap.documents[0].data()["nombre_completo"] as! String
                student.id=snap.documents[0].data()["matricula_o_nomina"] as! String
                student.campus="MTY"
                alumno.student=student
                alumno.currentCourse=0
                alumno.userCourseResults=[]
                alumno.studentUid=snap.documents[0].data()["uid"] as! String
                for course in PrepanetMindfulModel.persistentCourseList{
                    let copy: Course=course.copy() as! Course
                    copy.status="P"
                    alumno.userCourseResults.append(copy)
                }
                alumnos[alumno.studentUid]=alumno
            }
            let refInscripciones=db.collection("inscripcion").getDocuments(){
                (qsnap2, err2) in
                guard let snap2=qsnap2 else{
                    return
                }
                for doc in snap2.documents{
                    if(doc.data()["estatus"] as! String == "A"){
                        alumnos[doc.data()["usuario"] as! String]?.currentCourse+=1
                    }
                    alumnos[doc.data()["usuario"] as! String]?.userCourseResults[Int(doc.data()["oferta_taller"] as! String)! - 1].status=doc.data()["estatus"] as! String
                }
                var listaAlumnos: [StudentCourse]=[]
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
    func obtenerCuentaAlumnosInscritosCampus(campus: String,_ callbackFunction:@escaping (([Int]) ->  Void)){
        var studentCountList:[Int]=Array(repeating: 0, count: 50)
        let db = Firestore.firestore()
        let refAlumnos=db.collection("usuarios").whereField("credenciales", isEqualTo: 1).whereField("campus", isEqualTo: campus).getDocuments(){
            (qsnap, err) in
            guard let snap=qsnap else{
                return
            }
            var alumnos: [String : Student] = [:]
            for doc in snap.documents{
                let student=Student()
                student.name=snap.documents[0].data()["nombre_completo"] as! String
                student.id=snap.documents[0].data()["uid"] as! String
                student.campus=campus
                
                alumnos[student.id] = student
            }
            let refInscripciones=db.collection("inscripcion").getDocuments(){
                (qsnap2, err2) in
                guard let snap2=qsnap2 else{
                    return
                }
                for doc in snap2.documents{
                    if(doc.data()["estatus"] as! String == "I" && alumnos[doc.data()["usuario"] as! String]
                    != nil){
                        studentCountList[Int(doc.data()["oferta_taller"] as! String)! - 1]+=1
                    }
                }
                callbackFunction(studentCountList)
                
            }
        }
    }
    func obetenerCuentaAlumnosInscritosNacional(_ callbackFunction:@escaping (([Int]) ->  Void)){
        var studentCountList:[Int]=Array(repeating: 0, count: 50)
        let db = Firestore.firestore()
         let refInscripciones=db.collection("inscripcion").getDocuments(){
                (qsnap2, err2) in
                guard let snap2=qsnap2 else{
                    return
                }
                for doc in snap2.documents{
                    print("userfounbd")
                    if(doc.data()["estatus"] as! String == "I"){
                        studentCountList[Int(doc.data()["oferta_taller"] as! String)! - 1] += 1
                    }
                }
                
                callbackFunction(studentCountList)
                
            
        }
    }
}
class User{
    var nombre: String!
    var matriculaONomina: String!
    var credenciales: Int!
    var uid: String!
}
class StudentCourse{
    var studentUid: String!
    var student: Student!
    var currentCourse: Int!
    var userCourseResults: [Course]!
}
/*
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
}*/

class Enrollment{
    var estatus: String!
    var taller: String!
}
