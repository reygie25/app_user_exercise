//
//  UsersService.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import Foundation
import Alamofire

class UsersService:WebApi {
    private static var _instance = { UsersService() }
    static var instance:UsersService { return _instance() }
    
    func getUsers(onSuccess:@escaping ([User]) -> Void,
                  onFailure:@escaping(String) -> Void){
        let url = buildUrl(["users"])
        AF.request(url)
            .responseDecodable(of: [User].self) { response in
                switch response.result {
                case .success(let users):
                    onSuccess(users)
                case .failure(let errorMsg):
                    onFailure(errorMsg.localizedDescription)
                }
            }
    }
}
