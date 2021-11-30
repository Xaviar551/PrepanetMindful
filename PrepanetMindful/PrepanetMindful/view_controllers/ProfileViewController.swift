//
//  ProfileViewController.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var lbStudentName: UILabel!
    @IBOutlet weak var lbStudentId: UILabel!
    @IBOutlet weak var lbStudentStatus: UILabel!
    @IBOutlet weak var lbStudentPeriod: UILabel!
    @IBOutlet weak var lbStudentCampus: UILabel!
    
    var student : Student!
    var courses: [Course]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbStudentName.text = student.name
        lbStudentId.text = student.id
        lbStudentPeriod.text = "Inscrito"
        lbStudentPeriod.text = "Ago - Dic 2021"
        lbStudentCampus.text = student.campus
    }
    
    // MARK: - Custom Cell
    
    // Tamaño de celda con estatus de los cursos
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCourseCell", for: indexPath) as! ProfileCourseTableViewCell

        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        cell.setStatus(status: course.status)
        
        

        return cell
    }
    
}
