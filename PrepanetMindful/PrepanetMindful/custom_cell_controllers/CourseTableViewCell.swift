//
//  CourseTableViewCell.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/4/21.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var vwIconBackground: UIView!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lbCourseStatus: UILabel!
    @IBOutlet weak var imgCourseIcon: UIImageView!
    @IBOutlet weak var mainBackground: UIView!
    
    
    var statusMap = [
        "A" : 0,
        "NA": 1,
        "C": 2
    ]
    
    let textColors:[UIColor]=[.systemBlue, .systemRed, .systemYellow]
    let images:[UIImage?]=[
        UIImage(systemName: "checkmark"),
        UIImage(systemName: "exclamationmark.circle.fill"),
        UIImage(systemName: "star.fill")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Agregar esquinas redondas a las celdas personalizadas
        mainBackground.layer.cornerRadius = 10.0
        
        // Se agrega en las esquinas izquierda superior e izquierda inferior la
        // curvatura para el fondo azul detras del icono
        vwIconBackground.layer.cornerRadius = 10.0
        vwIconBackground.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMinXMaxYCorner
        ]
        
        // Se agrega la sombra a la celda personalizada
        mainBackground.layer.shadowColor = UIColor.black.cgColor
        mainBackground.layer.shadowOpacity = 0.25
        mainBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        mainBackground.layer.shadowRadius = 2.0
        mainBackground.layer.shadowPath = UIBezierPath(roundedRect: mainBackground.bounds, cornerRadius: 10).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStatus(status: String) {
        lbCourseStatus.textColor = .systemGray
        imgStatus.image = nil
        if let st=statusMap[status]{
            lbCourseStatus.textColor = textColors[st]
            imgStatus.image = images[st]
            imgStatus.tintColor = textColors[st]
        }
        
        
        /*
        switch status {
        case "Acreditado":
            lbCourseStatus.textColor = .systemBlue
            imgStatus.image = UIImage(systemName: "checkmark")
            imgStatus.tintColor = .systemBlue
        case "No Acreditado":
            lbCourseStatus.textColor = .systemRed
            imgStatus.image = UIImage(systemName: "exclamationmark.circle.fill")
            imgStatus.tintColor = .systemRed
        case "Cursando":
            lbCourseStatus.textColor = .systemYellow
            imgStatus.image = UIImage(systemName: "star.fill")
            imgStatus.tintColor = .systemYellow
        default:
            lbCourseStatus.textColor = .systemGray
            i mgStatus.image = nil
        }*/
    }

}
