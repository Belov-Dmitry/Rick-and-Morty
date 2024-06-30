//
//  EpisodesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class EpisodesCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .episodes }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let episodesViewController = EpisodesViewController()
        navigationController.pushViewController(episodesViewController, animated: true)
    }
}
