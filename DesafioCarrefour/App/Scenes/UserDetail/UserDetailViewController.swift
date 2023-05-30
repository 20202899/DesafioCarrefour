//
//  UserDetailViewController.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation
import UIKit

final class UserDetailViewController: UIViewController {
    private let viewModel: UserReposViewModelProtocol
    private var repos: RepoMapping = .init()
    
    private(set) lazy var contentTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(contentTableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = viewModel.user.login
        
        fetchRepos()
    }
    
    init(viewModel: UserReposViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        contentTableView.frame = .init(x: .zero, y: .zero, width: view.frame.width, height: view.frame.height)
    }
    
    private func fetchRepos() {
        viewModel.getRepos(success: { [weak self] repos in
            DispatchQueue.main.async {
                self?.repos = repos
                self?.contentTableView.reloadData()
            }
        }, failure: { _ in
            // TODO: Tratar caso de erro
        })
    }
}

extension UserDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = repos[indexPath.row].fullName
        return cell
    }
}
