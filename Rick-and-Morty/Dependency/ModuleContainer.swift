//
//  ModuleContainer.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 16.06.2024.
//

import Foundation
import UIKit

protocol ModuleContainerProtocol {
    func getLaunchView() -> UIViewController
    func getTabBarView() -> UIViewController
    func getEpisodesView() -> UIViewController
    func getFavouritesView() -> UIViewController
    func getDetailsView() -> UIViewController
}

final class ModuleContainer: ModuleContainerProtocol {
    private let dependencies: DependenciesProtocol
    required init(_ dependencies: DependenciesProtocol) {
        self.dependencies = dependencies
    }
}
// MARK: - LaunchVC
extension ModuleContainer {
    func getLaunchView() -> UIViewController {
        return LaunchScreenController()
    }
}
// MARK: - TabBarVC
extension ModuleContainer {
    func getTabBarView() -> UIViewController {
        let view = TabBarController()
        let episodesVC = EpisodesAssembly.configure(dependencies)
        let favouritesVC = FavouritesAssembly.configure(dependencies)
        view.setViewControllers([episodesVC, favouritesVC], animated: false)
        
        return view
    }
}
extension ModuleContainer {
    func getEpisodesView() -> UIViewController {
        let view = EpisodesViewController()
        view.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        let viewModel = EpisodesViewModel(dependencies)
        view.viewModel = viewModel
        return view
    }
}
extension ModuleContainer {
    func getFavouritesView() -> UIViewController {
        let view = FavouritesViewController()
        view.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 1)
        return view
    }
}
extension ModuleContainer {
    func getDetailsView() -> UIViewController {
//        let viewModel = DetailsViewModel(character: <#EpisodeAndCharacterModel#>)
//        let view = DetailsViewController(viewModel: <#T##DetailsViewModel?#>)
        return UIViewController()
    }
}
