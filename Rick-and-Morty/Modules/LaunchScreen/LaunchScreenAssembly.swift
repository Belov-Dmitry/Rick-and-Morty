//
//  LaunchScreenAssembly.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 17.06.2024.
//

import UIKit

final class LaunchScreenAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getLaunchView()
    }
}
