//
//  WebApi.swift
//  UsersApp
//
//  Created by Reygie Reyteran on 6/24/22.
//

import Foundation

class WebApi{
    private class var domain: String {
      return "jsonplaceholder.typicode.com"
    }
    
    func buildUrl(_ paths: [String]) -> String {
      var url = "https://\(WebApi.domain)"
      for path in paths {
        url += "/\(path)"
      }
      return url
    }
}
