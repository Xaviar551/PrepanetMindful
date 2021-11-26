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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(named: "DarkBlue")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! CourseTableViewCell

        let course = courses[indexPath.row]
        cell.lbCourseName.text = course.name
        cell.lbCourseStatus.text = course.status
        cell.imgCourseIcon.image = UIImage(systemName: icons[course.id]!)
        cell.setStatus(status: course.status)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if typeOfUser != "admin" {
            course=courses[indexPath.row]
            performSegue(withIdentifier: "showCourse", sender: tableView.cellForRow(at: indexPath))
        } else {
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
            nextView.course=course
        }
        
    }
    
}
