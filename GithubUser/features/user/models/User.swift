//
//  User.swift
//  GithubUser
//
//  Created by Khemmachat Thongkhum on 11/3/2563 BE.
//  Copyright © 2563 Khemmachat Thongkhum. All rights reserved.
//

import Foundation
import ObjectMapper
import IGListKit

class User: Mappable {
    var login: String!
    var id: Int!
    var avatarUrl: String!
    var url: String!
    var siteAdmin: Bool!

    required init?(map: Map) {}

    func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        url <- map["url"]
        siteAdmin <- map["site_admin"]
    }
}

extension User: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? User else { return false }
        return id == object.id
            && login == object.login
            && avatarUrl == object.avatarUrl
            && url == object.url
            && siteAdmin == object.siteAdmin
    }
}
