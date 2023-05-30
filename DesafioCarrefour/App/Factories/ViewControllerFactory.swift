//
//  ViewControllerFactory.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation
import UIKit

func makeUsersViewController(viewModel: UsersViewModelProtocol) -> UIViewController {
    return UsersViewController(viewModel: viewModel)
}

func makeUserReposViewController(viewModel: UserReposViewModelProtocol) -> UIViewController {
    return UserDetailViewController(viewModel: viewModel)
}
