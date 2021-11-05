//
//  CoursesTableViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/4/21.
//

import UIKit
import FirebaseFirestore

class CoursesTableViewController: UITableViewController {
    
    var typeOfUser: String!
    
    var courses = [
        Course(id: "1", name: "Liderazgo Positivo y Transformación Personal", status: "Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "En este taller aprenderás sobre cómo ser un líder y saber distinguir tus mejores cualidades."),
        Course(id: "2", name: "Mis habilidades y motivaciones", status: "No Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "Prepárate para conocerte mejor a ti mismo, lo que eres capaz de hacer así como lo que te motiva."),
        Course(id: "3", name: "Mis emociones", status: "Cursando", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "4", name: "Mis relaciones", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "5", name: "Mis áreas de oportunidad", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
        Course(id: "6", name: "Mis metas", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem")
    ]
    
    var icons = [
        "1" : "person.2.circle.fill",
        "2" : "heart.circle.fill",
        "3" : "smiley.fill",
        "4" : "person.2.fill",
        "5" : "book.circle.fill",
        "6" : "calendar"
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
    class CourseData{
        var name: String = ""
        var description: String = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cargar la informacion de los talleres
        // desde Firebase
        let db = Firestore.firestore()
        let docRef = db.collection("talleres").getDocuments(){(querySnap, err) in
            var count=0
            for doc in querySnap!.documents{
                print(doc.data())
                self.courses[count].name=doc.data()["name"] as! String
                self.courses[count].courseDescription=doc.data()["description"] as! String
                self.tableView.reloadData()
                count+=1
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //setTitle("Courses", andImage: UIImage(systemName: "book.closed.fill")!)
        navigationController?.navigationBar.barTintColor = UIColor(named: "DarkBlue")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell

        // Configure the cell...
        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        cell.lbCourseStatus.text = course.status
        cell.imgCourseIcon.image = UIImage(systemName: icons[course.id]!)
        
        switch course.status {
        case "Acreditado":
            cell.lbCourseStatus.textColor = .systemBlue
            cell.imgStatus.image = UIImage(systemName: "checkmark")
            cell.imgStatus.tintColor = .systemBlue
        case "No Acreditado":
            cell.lbCourseStatus.textColor = .systemRed
            cell.imgStatus.image = UIImage(systemName: "exclamationmark.circle.fill")
            cell.imgStatus.tintColor = .systemRed
        case "Cursando":
            cell.lbCourseStatus.textColor = .systemYellow
            cell.imgStatus.image = UIImage(systemName: "star.fill")
            cell.imgStatus.tintColor = .systemYellow
        default:
            cell.lbCourseStatus.textColor = .systemGray
            cell.imgStatus.image = nil
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showCourse" && self.typeOfUser == "admin" {
            performSegue(withIdentifier: "showStudents", sender: nil)
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourse" {
            let nextView = segue.destination as! CourseDetailViewController
            let index = tableView.indexPathForSelectedRow!
            nextView.course = courses[index.row]
        }
        else if segue.identifier == "showStudents" {
            let nextView = segue.destination as! StudentsTableViewController
            nextView.students = students
        }
        else {
            
        }
    }
    
}

extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        let lbTitle = UILabel()
        lbTitle.text = title
        lbTitle.textColor = UIColor.white
        lbTitle.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        
        let imgView = UIImageView(image: image)
        let titleView = UIStackView(arrangedSubviews: [imgView, lbTitle])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
    }
}
