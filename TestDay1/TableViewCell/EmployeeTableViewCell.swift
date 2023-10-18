//
//  EmployeeTableViewCell.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 18/10/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var isiGaji: UILabel!
    @IBOutlet weak var isiUmur: UILabel!
    @IBOutlet weak var isiNama: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
