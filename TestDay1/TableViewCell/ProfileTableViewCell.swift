//
//  ProfileTableViewCell.swift
//  TestDay1
//
//  Created by P090MMCTSE003 on 13/10/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(type: ProfileType, value: String){
        tableTitle.text = type.rawValue
        descriptionLabel.text = value
        if(type == ProfileType.bio){
            descriptionLabel.numberOfLines = 0
        } else{
            descriptionLabel.numberOfLines = 1
        }
    }
}
