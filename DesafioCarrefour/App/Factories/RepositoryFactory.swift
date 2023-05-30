//
//  RepositoryFactory.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation

func makeGithubRepository() -> GithubRepositoryProtocol {
    return GithubRepository()
}
