//
//  UserReposViewModelProtocol.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation

protocol UserReposViewModelProtocol {
    var user: User { get }
    func getRepos(success: @escaping (RepoMapping) -> Void, failure: @escaping (HTTPErrorType) -> Void)
}
