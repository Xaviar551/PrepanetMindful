//
//  CoursesVC.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 03/11/21.
//

import UIKit

class CoursesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var talleres: [Taller] = []
    @IBOutlet weak var tableCourses: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        talleres.append(Taller(id: "202619", nombre: "Liderazgo Positivo y Transformación Social", descripcion: "Descripcion de Liderazgo Positivo y Transformación Social"))
        talleres.append(Taller(id: "202620", nombre: "Mis habilidades y motivaciones", descripcion: "Descripcion de Español"))
        talleres.append(Taller(id: "202621", nombre: "Mis emociones", descripcion: "Descripcion de ciencias"))
        talleres.append(Taller(id: "202622", nombre: "Mis relaciones", descripcion: "Descripcion de programacion"))
        talleres.append(Taller(id: "202623", nombre: "Mis áreas de oportunidad", descripcion: "Descripcion de fisica"))
        talleres.append(Taller(id: "202624", nombre: "Mis metas", descripcion: "Descripcion de historia"))
//        for taller in talleres {
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
        return talleres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCourse") as! CourseCell
        cell.lbCourseName.text = talleres[indexPath.row].nombre
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tHeight = tableCourses.bounds.height
        let temp = tHeight/CGFloat(talleres.count)
        return temp
    }

}
