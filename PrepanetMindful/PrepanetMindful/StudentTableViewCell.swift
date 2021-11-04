//
//  StudentTableViewCell.swift
//  PrepanetMindful
//
//  Created by Cristian Omar Urbina Herrera on 04/11/21.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var lbUser: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
