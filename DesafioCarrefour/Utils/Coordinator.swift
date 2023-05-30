//
//  Coordinator.swift
//  DesafioCarrefour
//
//  Created by Carlos Silva on 28/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    var coordinators: [Self] { get }
    
    func start()
}
