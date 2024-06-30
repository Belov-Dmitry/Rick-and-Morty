//
//  FavouritesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class FavouritesCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favouritesViewController = FavouritesViewController()
        favouritesViewController.title = "Favourites episodes"
        navigationController.pushViewController(favouritesViewController, animated: true)
    }
}
