//
//  CoursesTableViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/4/21.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    var courses = [ Course(id: "1", name: "Liderazgo Positivo y Transformación Personal", status: "Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
                    Course(id: "2", name: "Mis habilidades y motivaciones", status: "No Acreditado", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
                    Course(id: "3", name: "Mis emociones", status: "Cursando", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
                    Course(id: "4", name: "Mis relaciones", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
                    Course(id: "5", name: "Mis áreas de oportunidad", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem"),
                    Course(id: "6", name: "Mis metas", status: "Próximo", startDate: Date(), finalDate: Date(), courseDescription: "Lorem")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 108
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! CourseDetailViewController
        let index = tableView.indexPathForSelectedRow!
        nextView.course = courses[index.row]
    }


}
