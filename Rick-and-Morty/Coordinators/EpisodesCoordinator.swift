//
//  EpisodesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class EpisodesCoordinator: Coordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .systemYellow
        navigationController.pushViewController(vc, animated: true)
    }
}
