//
//  UsersViewModel.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation

final class UsersViewModel: UsersViewModelProtocol {
    let repository: GithubRepositoryProtocol
    let coordinator: AppCoordinatorProtocol
    private var users: UserMapping = .init()
    
    subscript(search: String) -> UserMapping {
        guard search.count > .zero else { return users }
        
        return users.filter { $0.login.starts(with: search) }
    }
    
    init(repository: GithubRepositoryProtocol, coordinator: AppCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
    func getUsers(success: @escaping (UserMapping) -> Void, failure: @escaping (HTTPErrorType) -> Void) {
        repository.getUsers { [weak self] result in
            switch result {
            case .success(let data):
                self?.users = data
                success(data)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func didSelectUser(user: User) {
        coordinator.toUser(user: user)
    }
}
