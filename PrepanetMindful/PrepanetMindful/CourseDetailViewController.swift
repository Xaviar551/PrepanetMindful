//
//  CourseDetailViewController.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/3/21.
//

import UIKit

class CourseDetailViewController: UIViewController {

    @IBOutlet weak var imgCourseImage: UIImageView!
    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var lbCourseStatus: UILabel!
    @IBOutlet weak var lbStartDate: UILabel!
    @IBOutlet weak var lbFinalDate: UILabel!
    @IBOutlet weak var lbDescriptionTxt: UILabel!
    
    var course : Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "MMM d, yyyy"

        lbCourseName.text = course.name
        lbCourseStatus.text = course.status
        lbStartDate.text = formatter.string(from: course.startDate)
        lbFinalDate.text = formatter.string(from: course.finalDate)
        lbDescriptionTxt.text = course.description
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
