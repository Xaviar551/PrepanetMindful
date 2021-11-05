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

}
