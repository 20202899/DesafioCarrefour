//
//  UsersViewModelProtocol.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation

protocol UsersViewModelProtocol {
    subscript(search: String) -> UserMapping { get }
    func getUsers(success: @escaping (UserMapping) -> Void, failure: @escaping (HTTPErrorType) -> Void)
    func didSelectUser(user: User)
}
