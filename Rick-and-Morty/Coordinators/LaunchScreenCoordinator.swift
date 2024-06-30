//
//  LaunchScreenCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

final class LaunchScreenCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: DependenciesProtocol
    
    init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchViewController()
    }
    
    func showLaunchViewController() {
        let launchScreenController = LaunchScreenAssembly.configure(dependencies)
        if let launchScreenController = launchScreenController as? LaunchScreenController{
        launchScreenController.didSendEventHandler = { [weak self] event in
            switch event {
            case .launchComplete:
                self?.finish()
            }
        }
    }
        navigationController.pushViewController(launchScreenController, animated: true)
    }
}
