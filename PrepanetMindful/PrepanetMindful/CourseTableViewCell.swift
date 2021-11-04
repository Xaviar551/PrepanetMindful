//
//  CourseTableViewCell.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/4/21.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var lbCourseName: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lbCourseStatus: UILabel!
    @IBOutlet weak var imgCourseIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
