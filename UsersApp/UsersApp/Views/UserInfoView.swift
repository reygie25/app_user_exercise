//
//  UserInfoView.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import UIKit

class UserInfoView: UIView {
    
    
    func configure(delegate:UserInfoDelegate?){
        print("configuring user info view")
        guard let delegate = delegate else {
            return
        }

        print("User is \(delegate.userInfo!.name)")
    }

}
