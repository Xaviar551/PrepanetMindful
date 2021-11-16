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
    
    var courses = [
        Course(id: "1", name: "Liderazgo Positivo y Transformación Personal", status: "Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "En este taller aprenderás sobre cómo ser un líder y saber distinguir tus mejores cualidades."),
        Course(id: "2", name: "Mis habilidades y motivaciones", status: "No Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "Prepárate para conocerte mejor a ti mismo, lo que eres capaz de hacer así como lo que te motiva."),
        Course(id: "3", name: "Mis emociones", status: "Cursando", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "4", name: "Mis relaciones", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "5", name: "Mis áreas de oportunidad", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "6", name: "Mis metas", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem")
    ]
    
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
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCourseCell", for: indexPath) as! ProfileCourseTableViewCell

        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        
        let status = Int.random(in: 0...2)
        switch status {
        case 0:
            cell.lbStatus.text = "Acreditado"
            cell.lbStatusCode.text = "A"
            cell.lbStatus.textColor = .systemBlue
            cell.imgStatusCircle.tintColor = .systemBlue
            cell.vwStatusLeftBar.backgroundColor = .systemBlue
        case 1:
            cell.lbStatus.text = "No Acreditado"
            cell.lbStatusCode.text = "NA"
            cell.lbStatus.textColor = .systemRed
            cell.imgStatusCircle.tintColor = .systemRed
            cell.vwStatusLeftBar.backgroundColor = .systemRed
        case 2:
            cell.lbStatus.text = "Cursando"
            cell.lbStatusCode.text = "C"
            cell.lbStatus.textColor = .systemYellow
            cell.imgStatusCircle.tintColor = .systemYellow
            cell.vwStatusLeftBar.backgroundColor = .systemYellow
        default:
            cell.lbStatus.text = "Próximo"
            cell.lbStatusCode.text = "P"
            cell.lbStatus.textColor = .systemGray
            cell.imgStatusCircle.tintColor = .systemGray
            cell.vwStatusLeftBar.backgroundColor = .systemGray
        }

        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
