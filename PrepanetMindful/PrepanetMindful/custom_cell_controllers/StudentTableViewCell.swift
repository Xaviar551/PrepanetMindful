//
//  StudentTableViewCell.swift
//  PrepanetMindful
//
//  Created by user202610 on 11/11/21.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var statusCircle: UIImageView!
    @IBOutlet weak var lbStatusLetter: UILabel!
    
    let statusColors:[String : UIColor]=[
        "A": .systemBlue,
        "NA": .systemRed,
        "I": .systemOrange,
        "C": .systemYellow
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStatus(status: String) {
        lbStatusLetter.text = status
        statusCircle.tintColor = .systemGray
        if(statusColors[status] != nil){
            statusCircle.tintColor=statusColors[status]
        }
    }

}
