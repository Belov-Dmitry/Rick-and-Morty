//
//  Details.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class CharacterDetailsCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemGreen
        navigationController.pushViewController(vc, animated: true)
    }
}
