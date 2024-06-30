//
//  TabbarCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 10.04.2024.
//

import UIKit

class TabbarCoordinator: Coordinator {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabbar }
    var dependencies: DependenciesProtocol
    
    init(_ navigationController: UINavigationController, dependencies: DependenciesProtocol) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        navigationController.viewControllers.removeAll()
             
        let tabbarViewController = TabBarAssembly.configure(dependencies)
        let navVC = UINavigationController(rootViewController: tabbarViewController)
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            window.rootViewController = navVC
            UIView.transition(with: window, duration: 1.0, options: [.transitionCrossDissolve], animations: nil, completion: nil)
        } else {
            navVC.modalPresentationStyle = .fullScreen
            navigationController.showDetailViewController(navVC, sender: self)
        }
    }
    
    
}


//func start() {
//    navigationController.viewControllers.removeAll()
//    
//    let episodesNavigationController = UINavigationController()
//    let episodesCoordinator = EpisodesCoordinator(navigationController: episodesNavigationController)
//    episodesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
//    episodesCoordinator.start()
//    
//    let favouritesNavigationController = UINavigationController()
//    let favouritesCoordinator = FavouritesCoordinator(navigationController: favouritesNavigationController)
//    favouritesNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
//    favouritesCoordinator.start()
//    
//    //TODO: - проверить необходимость добавления координаторов в addChildCoordinator
//    childCoordinators.append(episodesCoordinator)
//    childCoordinators.append(favouritesCoordinator)
//    
//    let tabBarControllers = [episodesNavigationController, favouritesNavigationController]
//    let tabbarViewController = TabBarController(tabBarControllers: tabBarControllers)
//    tabbarViewController.view.backgroundColor = .systemYellow
//    navigationController.pushViewController(tabbarViewController, animated: true)
//}






//func start() {
//    navigationController.viewControllers.removeAll()
//         
//    let tabbarViewController = TabBarAssembly.configure(dependencies)
//    let navVC = UINavigationController(rootViewController: tabbarViewController)
//    
//    tabbarViewController.view.backgroundColor = .systemYellow
//    navigationController.showDetailViewController(navVC, sender: self)
//}
