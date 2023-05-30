//
//  GithubRepositoryProtocol.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import Foundation

protocol GithubRepositoryProtocol: Requestable {
    func getUsers(completion: @escaping (Result<UserMapping, HTTPErrorType>) -> Void)
    func getRepos(userName: String, completion: @escaping (Result<RepoMapping, HTTPErrorType>) -> Void)
}

struct GithubRepository: GithubRepositoryProtocol {
    func getUsers(completion: @escaping (Result<UserMapping, HTTPErrorType>) -> Void) {
        request(apiCall: .init(url: ApiLocalized.users.value, method: .get),
                completion: completion)
    }
    
    func getRepos(userName: String, completion: @escaping (Result<RepoMapping, HTTPErrorType>) -> Void) {
        request(apiCall: .init(url: ApiLocalized.repos.value(by: "/" + userName + "/"), method: .get), completion: completion)
    }
}
