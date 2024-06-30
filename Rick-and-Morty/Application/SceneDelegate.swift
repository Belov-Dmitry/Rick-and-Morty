//
//  SceneDelegate.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 04.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var coordinator: Coordinator?
    private var dependencies: DependenciesProtocol = Dependencies()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        coordinator = AppCoordinator(navigationController: navController, dependencies: dependencies)
        coordinator?.start()
    }
}

