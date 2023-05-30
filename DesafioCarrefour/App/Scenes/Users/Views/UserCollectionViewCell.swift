//
//  UserCollectionViewCell.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import SwiftUI

final class UserCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: UserCollectionViewCell.self)
    
    private(set) lazy var contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        addSubview(contentImageView)
        
        let contentImageViewConstraint = [
            contentImageView.topAnchor.constraint(equalTo: topAnchor),
            contentImageView.leftAnchor.constraint(equalTo: leftAnchor),
            contentImageView.rightAnchor.constraint(equalTo: rightAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(contentImageViewConstraint)
    }
    
    func configure(by user: User) {
        contentImageView.loadImage(by: user.avatarURL)
    }
}

struct UserCollectionViewCell_Representable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return UserCollectionViewCell(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct UserCollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCollectionViewCell_Representable()
            .ignoresSafeArea()
    }
}
