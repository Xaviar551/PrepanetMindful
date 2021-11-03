//
//  CourseView.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 02/11/21.
//

import UIKit

@IBDesignable 
class CourseView: UIView {
    
    private weak var imageView: UIImageView!
    private weak var lbCourseName: UILabel!
    private weak var lbCourseStatus: UILabel!
    private weak var btnArrow: UIButton!
    private weak var btnInfo: UIButton!
    var taller: Taller!
    init(taller: Taller) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.taller = taller
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        //
        self.backgroundColor = UIColor.clear
        self.round(cornerRadius: 20, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        // Create image
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2).isActive = true
        imageView.image = UIImage(systemName: "checkmark.square.fill")
        imageView.contentMode = .scaleAspectFit
        self.imageView = imageView

        // Create name
        let lbCourseName = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.addSubview(lbCourseName)
        lbCourseName.translatesAutoresizingMaskIntoConstraints = false
        lbCourseName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        //lbCourseName.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lbCourseName.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55).isActive = true
        lbCourseName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        lbCourseName.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        lbCourseName.text = taller.nombre
        lbCourseName.numberOfLines = 2
        lbCourseName.backgroundColor = UIColor.clear
        //lbCourseName.textAlignment = .center
        lbCourseName.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.lbCourseName = lbCourseName
        
        // Create status
        let lbCourseStatus = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.addSubview(lbCourseStatus)
        lbCourseStatus.translatesAutoresizingMaskIntoConstraints = false
        lbCourseStatus.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        lbCourseStatus.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        lbCourseStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        lbCourseStatus.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20).isActive = true
        //lbCourseStatus.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lbCourseStatus.text = "Acreditado"
        lbCourseStatus.backgroundColor = UIColor.clear
        //lbCourseStatus.textAlignment = .center
        self.lbCourseName = lbCourseName
        
        
        // Create buttons
        
        // Status button
        let btnInfo = UIButton(type: .infoDark)
        btnInfo.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        self.addSubview(btnInfo)
        btnInfo.translatesAutoresizingMaskIntoConstraints = false
        btnInfo.leadingAnchor.constraint(equalTo: lbCourseStatus.trailingAnchor, constant: 5).isActive = true
        btnInfo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        btnInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        btnInfo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        btnInfo.backgroundColor = UIColor.clear
        self.btnInfo = btnInfo
        
        // Arrow button
        let btnArrow = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.addSubview(btnArrow)
        btnArrow.translatesAutoresizingMaskIntoConstraints = false
        btnArrow.leadingAnchor.constraint(equalTo: lbCourseStatus.trailingAnchor, constant: 5).isActive = true
        btnArrow.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        //btnArrow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7).isActive = true
        btnArrow.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.07).isActive = true
        btnArrow.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        btnArrow.backgroundColor = UIColor.red
        btnArrow.setBackgroundImage(UIImage(named: "arrow"), for: UIControl.State.normal)
        btnArrow.round(cornerRadius: btnArrow.frame.size.height/4, borderWidth: 1.0, borderColor: UIColor.clear)
        //btnArrow.contentMode = .scaleAspectFill
        self.btnArrow = btnArrow
    }
}
