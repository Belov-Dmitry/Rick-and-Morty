//
//  TabbarCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 10.04.2024.
//

import UIKit

class TabbarCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        navigationController.viewControllers.removeAll()
        
        let episodesNavigationController = UINavigationController()
        let episodesCoordinator = EpisodesCoordinator(navigationController: episodesNavigationController)
        episodesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        episodesCoordinator.start()
        
        let favouritesNavigationController = UINavigationController()
        let favouritesCoordinator = FavouritesCoordinator(navigationController: favouritesNavigationController)
        favouritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        favouritesCoordinator.start()
        
        //TODO: - проверить необходимость добавления координаторов в addChildCoordinator
        addChildCoordinator(episodesCoordinator)
        addChildCoordinator(favouritesCoordinator)
        
        let tabBarControllers = [episodesNavigationController, favouritesNavigationController]
        let tabbarViewController = TabBarController(tabBarControllers: tabBarControllers)
        tabbarViewController.view.backgroundColor = .systemYellow
        navigationController.pushViewController(tabbarViewController, animated: true)
    }
    
    override func finish() {
    }
}
