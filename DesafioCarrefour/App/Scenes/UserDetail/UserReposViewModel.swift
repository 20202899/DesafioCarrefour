//
//  UserReposViewModel.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation

final class UserReposViewModel: UserReposViewModelProtocol {
    private let repository: GithubRepositoryProtocol
    let user: User
    
    init(repository: GithubRepositoryProtocol, user: User) {
        self.repository = repository
        self.user = user
    }
    
    func getRepos(success: @escaping (RepoMapping) -> Void, failure: @escaping (HTTPErrorType) -> Void) {
        repository.getRepos(userName: user.login) { result in
            switch result {
            case .success(let repos):
                success(repos)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
}
