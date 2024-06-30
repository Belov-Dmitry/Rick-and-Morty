//
//  Coordinator.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 06.04.2024.
//

import Foundation
import UIKit

enum CoordinatorType {
    case app, launch, episodes, favourites, tabbar
}

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get }
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }

    func start()
    func finish()
}

extension Coordinator {
//    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
//        childCoordinators.append(childCoordinator)
//    }
//    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
//        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
//    }
    func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}



