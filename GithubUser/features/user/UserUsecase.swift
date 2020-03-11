//
//  UserUsecase.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class UserUseCase {
    typealias FetchUserCompletion = (_ users: [User]?, _ error: String?) -> Void
    
    func fetchUsers(lastUserId: Int, completion: @escaping FetchUserCompletion) {
        AF.request("https://api.github.com/users?since=\(lastUserId)").responseJSON { response in
            guard let value = response.value as? [[String: Any]] else {
                completion(nil, "Server not response")
                return
            }
            
            let users = Mapper<User>().mapArray(JSONArray: value)
            
            completion(users, nil)
        }
    }
    
    func fetchFavoriteUsers() {}
    
    func likeUser() {}
    
    func unlikeUser() {}
}
