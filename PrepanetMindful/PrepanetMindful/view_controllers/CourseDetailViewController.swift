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
    
    
    var canEnrol: Bool!
        
    var course : Course!
    let mapStatusToStatusN=[
        "A":"Acreditado",
        "NA":"No Acreditado",
        "C":"Cursando",
        "I": "Inscrito",
        "P": "Pendiente"
    ]
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEnroll.isEnabled=canEnrol
        btnEnroll.layer.cornerRadius = btnEnroll.frame.size.height/2
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "MMM d, yyyy"

        lbCourseName.text = course.name
        lbCourseStatus.text = mapStatusToStatusN[course.status]
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
    @IBAction func enrolAction(_ sender: Any) {
        let alerta=UIAlertController(title: "Inscripcion de curso", message: "¿Estas segur@ de que quieres inscribir el curso?", preferredStyle: .alert)
        let botonOK=UIAlertAction(title:"Si",style: .default, handler: {action in
            let model=PrepanetMindfulModel()
            
            model.registrarInscripcion(curso: self.course.id)
            self.navigationController?.popViewController(animated: true)
        })
        let botonNo=UIAlertAction(title:"No",style: .cancel, handler: nil)
        alerta.addAction(botonOK)
        alerta.addAction(botonNo)
        present(alerta, animated:true, completion: nil)
        
    }
    

}
