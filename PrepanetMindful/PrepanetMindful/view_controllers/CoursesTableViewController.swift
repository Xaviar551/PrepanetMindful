//
//  CoursesTableViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/4/21.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    var typeOfUser: String!
    
    var icons = [
        "1" : "person.2.circle.fill",
        "2" : "heart.circle.fill",
        "3" : "smiley.fill",
        "4" : "person.2.fill",
        "5" : "book.circle.fill",
        "6" : "calendar"
    ]
    
    var course: Course!
    var scourse: Course!
        
    var canEnrol=false
    var courses: [Course]=[]
    var courseIndex=0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: "DarkBlue")
        self.reloadView()
    }
    override func viewWillAppear(_ animated: Bool) {
       reloadView()
        
    }
    func reloadView(){
        let model=PrepanetMindfulModel()
        model.obtenerInformacionDeCursosUsuarioActual({
            (userCourses: [Course])->Void in
            self.courses=userCourses
            if self.typeOfUser=="admin"{
                for course in self.courses{
                    course.status=""
                }
                model.obetenerCuentaAlumnosInscritosNacional({(cuenta: [Int]) in
                    var i=0
                    for course in self.courses{
                        course.status="Alumnos inscritos: "+String(cuenta[i])
                        print(cuenta[i])
                        i+=1
                    }
                    self.tableView.reloadData()
                })
            }
            else{
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    let mapStatusToStatusN=[
            "A":"Acreditado",
            "NA":"No Acreditado",
            "C":"Cursando",
            "I": "Inscrito",
            "P": "Pendiente"
        ]
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell

        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        if(mapStatusToStatusN[course.status] != nil){
            cell.lbCourseStatus.text = mapStatusToStatusN[course.status]
        }
        else{
            cell.lbCourseStatus.text = course.status
        }
        cell.imgCourseIcon.image = UIImage(systemName: icons[course.id]!)
        cell.setStatus(status: course.status)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if typeOfUser != "admin" {
            scourse=courses[indexPath.row]
            var currentCourse=0
            for course in courses{
                if course.status=="A"{
                    currentCourse+=1
                }
            }
            let model=PrepanetMindfulModel()
            model.openEnrollment({
                (isEnrollmentOpen: Bool) in
                                    self.canEnrol = currentCourse==indexPath.row &&  isEnrollmentOpen && (self.scourse.status=="NA" || self.scourse.status=="P")
                self.performSegue(withIdentifier: "showCourse", sender: tableView.cellForRow(at: indexPath))
            })
           
        } else {
            courseIndex=indexPath.row
            performSegue(withIdentifier: "showStudents", sender: tableView.cellForRow(at: indexPath))
        }
    }

    // MARK: - Navigation
    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showCourse" && typeOfUser == "admin" {
            performSegue(withIdentifier: "showStudents", sender: nil)
            return false
        }
        return true
    }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourse" {
            let nextView = segue.destination as! CourseDetailViewController
            nextView.course=scourse
            nextView.canEnrol=canEnrol
        } else {
            let nextView = segue.destination as! StudentsViewController
            nextView.courseIndex=courseIndex
        }
        
    }
    
}
