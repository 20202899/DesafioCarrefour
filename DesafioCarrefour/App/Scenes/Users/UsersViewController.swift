//
//  ViewController.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 27/05/23.
//

import UIKit

final class UsersViewController: UIViewController {
    private let viewModel: UsersViewModelProtocol
    
    private(set) lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = AppLocalized.titleSearchUser.value
        search.sizeToFit()
        search.delegate = self
        search.showsCancelButton = true
        return search
    }()
    
    private(set) lazy var usersView: UsersView = {
        let view = UsersView(frame: .zero)
        view.didSelectItem = { [weak self] user in
            self?.viewModel.didSelectUser(user: user)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    init(viewModel: UsersViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AppLocalized.titleUsers.value
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        
        view.addSubview(usersView)
        
        let usersViewConstraint = [
            usersView.topAnchor.constraint(equalTo: view.topAnchor),
            usersView.leftAnchor.constraint(equalTo: view.leftAnchor),
            usersView.rightAnchor.constraint(equalTo: view.rightAnchor),
            usersView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(usersViewConstraint)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUsers()
    }
    
    private func fetchUsers() {
        self.viewModel.getUsers { users in
            DispatchQueue.main.async { [weak self] in
                
                self?.usersView[users]
            }
        } failure: { error in
            
        }
    }
}

extension UsersViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = .init()
        search(.init())
        searchBar.endEditing(true)
    }
    
    fileprivate func search(_ searchText: String) {
        let users = viewModel[searchText]; usersView[users]
    }
}
