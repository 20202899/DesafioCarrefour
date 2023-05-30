//
//  AppCoordinator.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func toUser(user: User)
}

final class AppCoordinator: AppCoordinatorProtocol {
    let navigationController: UINavigationController
    let repository = makeGithubRepository()
    var coordinators: [AppCoordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = makeUsersViewModel(repository: repository, coordinator: self)
        let viewController = makeUsersViewController(viewModel: viewModel)
        
        navigationController.show(viewController, sender: viewController)
    }
    
    func toUser(user: User) {
        let viewModel = makeUserReposViewModel(repository: repository, user: user)
        let viewController = makeUserReposViewController(viewModel: viewModel)
        
        navigationController.show(viewController, sender: viewController)
    }
}
