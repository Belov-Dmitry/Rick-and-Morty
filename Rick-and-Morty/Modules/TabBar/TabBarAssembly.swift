//
//  TabBarAssembly.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 16.06.2024.
//

import Foundation
import UIKit

final class TabBarAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getTabBarView()
    }
}
