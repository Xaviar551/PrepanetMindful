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
    @IBOutlet weak var btnEnroll: UIButton!
    
    @IBOutlet weak var startStackView: UIStackView!
    @IBOutlet weak var finalStackView: UIStackView!
    
    var course : Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnEnroll.layer.cornerRadius = btnEnroll.frame.size.height/2
        
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        startStackView.addArrangedSubview(spacerView)
        let spacerView2 = UIView()
        spacerView2.setContentHuggingPriority(.defaultLow, for: .horizontal)
        finalStackView.addArrangedSubview(spacerView2)
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "MMM d, yyyy"

        lbCourseName.text = course.name
        lbCourseStatus.text = course.status
        lbStartDate.text = formatter.string(from: course.startDate)
        lbFinalDate.text = formatter.string(from: course.finalDate)
        lbDescriptionTxt.text = course.courseDescription
        imgCourseImage.image = UIImage(named: "tec\(course.id).jpg")
        
        switch course.status {
        case "Acreditado":
            lbCourseStatus.textColor = .systemBlue
        case "No Acreditado":
            lbCourseStatus.textColor = .systemRed
        case "Cursando":
            lbCourseStatus.textColor = .systemYellow
        default:
            lbCourseStatus.textColor = .systemGray
        }
    }
    

}