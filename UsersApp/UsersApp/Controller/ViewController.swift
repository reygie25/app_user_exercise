//
//  ViewController.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserInfoDelegate {
    
    var userInfo: User?
    
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    var items:[User] = []
    let service = UsersService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(fetchUsers), for: .valueChanged)
        fetchUsers()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user_cell") as! UserCellTableViewCell
        cell.configure(user: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let user = items[indexPath.row]
        self.userInfo = user
        print("Selected: \(user.name)")
        performSegue(withIdentifier: "user_info", sender: user)
    }
    
    @objc func fetchUsers(){
        print("fetch_user", "Fetching users...")
        if !refreshControl.isRefreshing {refreshControl.beginRefreshing()}
        service.getUsers { users in
            print("fetch_user", users.count)
            self.items = users
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        } onFailure: { errorMsg in
            print("fetch_user", errorMsg)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let userController = segue.destination as? UserInfoController{
            userController.delegate = self
        }
    }

}

