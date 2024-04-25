//
//  FavouritesCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class FavouritesCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = FavouritesViewController()
        vc.title = "Favourites episodes"
        navigationController.pushViewController(vc, animated: true)
    }
}
