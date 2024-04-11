//
//  LaunchScreenCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class LaunchScreenCoordinator: Coordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let launchScreenController = LaunchScreenController()
        launchScreenController.launchScreenCoordinator = self
        navigationController.pushViewController(launchScreenController, animated: true)
    }
    
    func showTabbar() {
        let tabbarCoordinator = TabbarCoordinator(navigationController: navigationController)
        addChildCoordinator(tabbarCoordinator)
        tabbarCoordinator.start()
    }
}
