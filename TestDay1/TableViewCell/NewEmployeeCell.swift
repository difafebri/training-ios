//
//  NewEmployeeCell.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 19/10/23.
//

import UIKit

class NewEmployeeCell: UITableViewCell {

    @IBOutlet weak var isiSalary: UILabel!
    @IBOutlet weak var isiNama: UILabel!
    @IBOutlet weak var isiID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setEmployee(){
        
    }
    
}
