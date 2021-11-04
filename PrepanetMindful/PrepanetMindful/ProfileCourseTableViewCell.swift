//
//  ProfileCourseTableViewCell.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class ProfileCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var lbCourseStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
