//
//  EpisodesAssembly.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 16.06.2024.
//

import UIKit

final class EpisodesAssembly {
    static func configure(_ dependencies: DependenciesProtocol) -> UIViewController {
        return dependencies.moduleContainer.getEpisodesView()
    }
}
