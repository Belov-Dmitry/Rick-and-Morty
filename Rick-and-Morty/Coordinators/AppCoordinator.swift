//
//  AppCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let launchScreenCoordinator = LaunchScreenCoordinator(navigationController: navigationController)
        addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
    }
}
