//
//  LaunchScreenCoordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation

class LaunchScreenCoordinator: Coordinator {

    override func start() {
        //let presenter = LaunchScreenViewPresenter(coordinator: self)
        let vc = LaunchScreenController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
