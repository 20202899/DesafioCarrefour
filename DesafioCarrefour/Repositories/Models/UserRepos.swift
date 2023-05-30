//
//  UserRepos.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation

typealias RepoMapping = [UserRepos]

struct UserRepos: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case url
    }
}
