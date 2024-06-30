//
//  AppCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    var dependencies: DependenciesProtocol
    
    
    init(navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchFlow()
    }
    
    
    func showLaunchFlow() {
        let launchScreenCoordinator = LaunchScreenCoordinator(navigationController: navigationController, dependencies: dependencies)
        launchScreenCoordinator.finishDelegate = self
        launchScreenCoordinator.start()
        childCoordinators.append(launchScreenCoordinator)
    }
    
    func showTabbar() {
        let tabbarCoordinator = TabbarCoordinator(navigationController, dependencies: dependencies)
        tabbarCoordinator.finishDelegate = self
        tabbarCoordinator.start()
        childCoordinators.append(tabbarCoordinator)
    }
    
    func showEpisodes() {
        let episodesCoordinator = EpisodesCoordinator(navigationController: navigationController)
        episodesCoordinator.finishDelegate = self
        episodesCoordinator.start()
        childCoordinators.append(episodesCoordinator)
    }
    
    func showFavourites() {
        let favouritesCoordinator = FavouritesCoordinator(navigationController: navigationController)
        favouritesCoordinator.finishDelegate = self
        favouritesCoordinator.start()
        childCoordinators.append(favouritesCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .launch:
                showTabbar()
        case .app, .episodes, .favourites, .tabbar: break
        }
    }
}
