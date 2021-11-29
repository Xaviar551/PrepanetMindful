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
    // var courses: [Course]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        student = Student(id: "A01283165", name: "Ricardo Rodriguez Rodriguez", campus: "Monterrey")
        
        lbStudentName.text = student.name
        lbStudentId.text = student.id
        lbStudentPeriod.text = "Inscrito"
        lbStudentPeriod.text = "Ago - Dic 2021"
        lbStudentCampus.text = student.campus
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        defaultCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCourseCell", for: indexPath) as! ProfileCourseTableViewCell

        let course = defaultCourses[indexPath.row]
        cell.lbCourseName.text = course.name
        
        let status = Int.random(in: 0...2)
        cell.setStatus(status: status)

        return cell
    }
    
}
