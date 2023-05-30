//
//  ViewFactory.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation
import UIKit

func makeCollectionViewCompositionalLayout() -> UICollectionViewCompositionalLayout {
    return UICollectionViewCompositionalLayout { index, environment in
        let fraction: CGFloat = 1 / 3
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 2, leading: .zero, bottom: .zero, trailing: .zero)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 2
        return section
    }
}
