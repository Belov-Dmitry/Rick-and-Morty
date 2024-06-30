//
//  Dependencies.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 16.06.2024.
//

import Foundation

protocol DependenciesProtocol {
    var moduleContainer: ModuleContainerProtocol { get }
    var userDefaultsRepository: UserDefaultsRepositoryProtocol { get }
    var networkService: NetworkServiceProtocol { get }
    var characterImageService: CharacterImageServiceProtocol { get }
}
    
    
final class Dependencies: DependenciesProtocol {
    lazy var moduleContainer: ModuleContainerProtocol = ModuleContainer(self)
    lazy var userDefaultsRepository: UserDefaultsRepositoryProtocol = UserDefaultsRepository()
    lazy var networkService: NetworkServiceProtocol = NetworkService()
    lazy var characterImageService: CharacterImageServiceProtocol = CharacterImageService()
}
