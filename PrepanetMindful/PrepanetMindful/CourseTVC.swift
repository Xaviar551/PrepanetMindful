//
//  TableViewCellClass.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 03/11/21.
//

import UIKit

class CourseTVC: UITableViewCell {

    @IBOutlet weak var imgCourseImage: UIView!
    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var btnArrow: UIButton!
    @IBOutlet var innerContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //innerContainer.round(cornerRadius: 5.0, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        contentView.round(cornerRadius: 5.0, borderWidth: 2.0, borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }

}
