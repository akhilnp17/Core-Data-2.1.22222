//
//  CellRecordTableViewCell.swift
//  Core Data 2.1
//
//  Created by AKHIL N P on 01/02/23.
//

import UIKit

class CellRecordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellName: UILabel!
    
    @IBOutlet weak var cellEmail: UILabel!
    
    @IBOutlet weak var cellPass: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
