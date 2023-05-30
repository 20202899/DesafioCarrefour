//
//  UsersView.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import SwiftUI
import UIKit

final class UsersView: UIView {
    private var users: UserMapping = .init()
    
    subscript(users: UserMapping) -> Void {
        self.users = users
        return self.contentCollectionView.reloadData()
    }
    
    var didSelectItem: ((User)->Void)?
    
    private(set) lazy var contentCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewCompositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: UserCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        addSubview(contentCollectionView)
        
        let contentCollectionViewConstraint = [
            contentCollectionView.topAnchor.constraint(equalTo: topAnchor),
            contentCollectionView.leftAnchor.constraint(equalTo: leftAnchor),
            contentCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            contentCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(contentCollectionViewConstraint)
    }
}

extension UsersView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.identifier, for: indexPath) as? UserCollectionViewCell else { return UserCollectionViewCell(frame: .zero) }
        
        cell.configure(by: users[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItem?(users[indexPath.row])
    }
}

struct UsersView_Representable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return UsersView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView_Representable()
            .ignoresSafeArea()
    }
}
