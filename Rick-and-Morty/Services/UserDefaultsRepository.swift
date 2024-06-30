//
//  EpisodeStorage.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 28.04.2024.
//

import Foundation

protocol UserDefaultsRepositoryProtocol{
    
}

class UserDefaultsRepository: UserDefaultsRepositoryProtocol {
    enum KeyUserDefaults { static let episodeDataKey = "savedEpisodes" }
    
    static let shared = UserDefaultsRepository()

    private var episodes: [Episode] = []

    func saveEpisodes(episodes: [Episode]) {
        UserDefaults.standard.set(episodes, forKey: KeyUserDefaults.episodeDataKey)
    }

    func loadEpisodes() -> [Episode]? {
        if let savedEpisodesData = UserDefaults.standard.object(forKey: KeyUserDefaults.episodeDataKey) as? Data {
            return try? JSONDecoder().decode([Episode].self, from: savedEpisodesData)
        }
        return nil
    }

    func clearEpisodes() {
        UserDefaults.standard.removeObject(forKey: KeyUserDefaults.episodeDataKey)
        episodes = []
    }
}
