//
//  UIImageView+Extensions.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 29/05/23.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(by url: String) {
        guard let url = URL(string: url) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, urlResponse, error in
            guard error == nil else { return }
            guard let data = data, let _ = urlResponse as? HTTPURLResponse else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
