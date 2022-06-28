//
//  UserCellTableViewCell.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(user:User){
        nameLabel.text = user.name
        userNameLabel.text = user.username
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
