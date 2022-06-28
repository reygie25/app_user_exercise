//
//  UserInfoController.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import UIKit

class UserInfoController: UIViewController {

    let userInfoView = UserInfoView()
    var delegate:UserInfoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userInfoView.configure(delegate: self.delegate)
    }

}


protocol UserInfoDelegate:UIViewController{
   var userInfo: User? { get }
}
