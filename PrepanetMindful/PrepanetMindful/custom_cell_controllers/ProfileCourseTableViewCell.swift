//
//  ProfileCourseTableViewCell.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class ProfileCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var vwMainBackground: UIView!
    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var lbStatusCode: UILabel!
    @IBOutlet weak var vwStatusLeftBar: UIView!
    @IBOutlet weak var imgStatusCircle: UIImageView!
    @IBOutlet weak var lbStatus: UILabel!
    
    let statusTexts = [
        "A",
        "NA",
        "C"
    ]
    let statusTextFull = [
        "Acreditado",
        "No Acreditado",
        "Cursando"
    ]
    let statusColors:[UIColor]=[
        .systemBlue,
        .systemRed,
        .systemYellow
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Agregar esquinas redondas a las celdas personalizadas
        vwMainBackground.layer.cornerRadius = 10.0
        
        // Se agrega en las esquinas izquierda superior e izquierda inferior la
        // curvatura para el fondo azul
        vwStatusLeftBar.layer.cornerRadius = 10.0
        vwStatusLeftBar.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMinXMaxYCorner
        ]
        
        // Se agrega la sombra a la celda personalizada
        vwMainBackground.layer.shadowColor = UIColor.black.cgColor
        vwMainBackground.layer.shadowOpacity = 0.25
        vwMainBackground.layer.shadowOffset = CGSize(width: 0, height: 4)
        vwMainBackground.layer.shadowRadius = 2.0
        vwMainBackground.layer.shadowPath = UIBezierPath(roundedRect: vwMainBackground.bounds, cornerRadius: 10).cgPath
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStatus(status: Int) {
        lbStatus.text = "Proximo"
        lbStatusCode.text = "P"
        lbStatus.textColor = .systemGray
        imgStatusCircle.tintColor = .systemGray
        vwStatusLeftBar.backgroundColor = .systemGray
        
        if((0...2).contains(status)){
            lbStatus.text = statusTextFull[status]
            lbStatusCode.text = statusTexts[status]
            lbStatus.textColor = statusColors[status]
            imgStatusCircle.tintColor = statusColors[status]
            vwStatusLeftBar.backgroundColor = statusColors[status]
            
        }
    }

}