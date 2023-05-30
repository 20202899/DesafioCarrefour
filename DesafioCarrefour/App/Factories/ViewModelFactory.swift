//
//  ViewModelFactory.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation


func makeUsersViewModel(repository: GithubRepositoryProtocol, coordinator: AppCoordinatorProtocol) -> UsersViewModelProtocol {
    return UsersViewModel(repository: repository, coordinator: coordinator)
}

func makeUserReposViewModel(repository: GithubRepositoryProtocol, user: User) -> UserReposViewModelProtocol {
    return UserReposViewModel(repository: repository, user: user)
}
