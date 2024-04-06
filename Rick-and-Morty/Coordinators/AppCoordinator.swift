//
//  AppCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    override func start() {
        showLaunchScreenFlow()
        //showTabBarFlow()
        //showCharacterDetails()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

 //MARK: Navigation methods

extension AppCoordinator {
    func showLaunchScreenFlow() {
        guard let navigationController = navigationController else { return }
        let launchScreenCoordinator = LaunchScreenCoordinator(type: .launchScreen, 
                                                              navigationController: navigationController,
                                                              finishDelegate: self)
        addChildCoordinator(launchScreenCoordinator)
        launchScreenCoordinator.start()
    }
    
    func showTabBarFlow() {
        guard let navigationController = navigationController else { return }
        
        let episodesNavigationController = UINavigationController()
        let episodesCoordinator = EpisodesCoordinator(type: .episodes, 
                                                      navigationController: episodesNavigationController)
        episodesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        episodesCoordinator.finishDelegate = self
        episodesCoordinator.start()
        
        let favouritesNavigationController = UINavigationController()
        let favouritesCoordinator = FavouritesCoordinator(type: .favourites, 
                                                          navigationController: favouritesNavigationController)
        favouritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        favouritesCoordinator.finishDelegate = self
        favouritesCoordinator.start()
        
        addChildCoordinator(episodesCoordinator)
        addChildCoordinator(favouritesCoordinator)
        
        let tabBarControllers = [episodesNavigationController, favouritesNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showCharacterDetails() {
        guard let navigationController = navigationController else { return }
        let characterDetailsCoordinator = CharacterDetailsCoordinator(type: .favourites, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(characterDetailsCoordinator)
        characterDetailsCoordinator.start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .launchScreen:
            return
        default: break
        }
    }
}
