//
//  ProfileViewController.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    var studentName: String!
    var studentId: String!
    var courses: [Course]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cambiar estooooo , es horrible pero rapido
        let myVC: CoursesTableViewController = CoursesTableViewController(nibName: nil, bundle: nil)
        courses = myVC.courses
        name.text = studentName
        id.text = studentId
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCourseCell", for: indexPath) as! ProfileCourseTableViewCell

        // Configure the cell...
        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        cell.lbStatus.text = course.status

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
