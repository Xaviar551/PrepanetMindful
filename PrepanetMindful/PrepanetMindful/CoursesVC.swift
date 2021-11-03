//
//  CoursesVC.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 03/11/21.
//

import UIKit

class CoursesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var courses: [Course] = []
    @IBOutlet weak var tableCourses: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        courses.append(Course(id: "202619", name: "Liderazgo Positivo y Transformación Social", courseDescription: "Descripcion de Liderazgo Positivo y Transformación Social"))
        courses.append(Course(id: "202620", name: "Mis habilidades y motivaciones", courseDescription: "Descripcion de Español"))
        courses.append(Course(id: "202621", name: "Mis emociones", courseDescription: "Descripcion de ciencias"))
        courses.append(Course(id: "202622", name: "Mis relaciones", courseDescription: "Descripcion de programacion"))
        courses.append(Course(id: "202623", name: "Mis áreas de oportunidad", courseDescription: "Descripcion de fisica"))
        courses.append(Course(id: "202624", name: "Mis metas", courseDescription: "Descripcion de historia"))
//        for taller in courses {
//            let myView = CourseView(taller: taller)
//            stackViewCourses.addArrangedSubview(myView)
//        }
        tableCourses.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCourse") as! CourseTVC
        cell.lbCourseName.text = courses[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tHeight = tableCourses.bounds.height
        let temp = tHeight/CGFloat(courses.count)
        return temp
    }

}
