//
//  EpisodesViewModel.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 28.04.2024.
//

import Foundation
import UIKit

class EpisodesViewModel {
    let episodeStorage: UserDefaultsRepositoryProtocol
    let networkService: NetworkServiceProtocol
    let characterImageService: CharacterImageServiceProtocol
    var episodesArray: [Episode] = []
    var charactersArray: [String] = []
    var episodesWithCharacterArray: [EpisodeAndCharacterModel] = []
    var dataSourceArray: Observable<[EpisodeAndCharacterModel]> = Observable(nil)
    
    var tempDict: [String:String] = [:]
    
    
    
    init(_ dependencies: DependenciesProtocol) {
        episodeStorage = dependencies.userDefaultsRepository
        networkService = dependencies.networkService
        characterImageService = dependencies.characterImageService
    }
    
    
    //получить массив эпизодов
    func getEpisodes() {
        networkService.getEpisodes { episodes, error in
            if let error = error {
                print("Error fetching episodes: \(error)")
                return
            }
            guard let episodes = episodes else {
                print("No episodes found")
                return
            }
            //DispatchQueue.main.async {
            self.episodesArray = episodes
            //print(self.episodesArray)
            self.getRandomCharacterForEpisode()
            //print(self.charactersArray)
            //self.makeEpisodesWithCharacterArray()
            // }
        }
    }
    
    //для каждого эпизода выбрать одного персонажа
    func getRandomCharacterForEpisode() {
        if !episodesArray.isEmpty {
            episodesArray.forEach { episode in
                let randomIndex = Int.random(in: 0..<episode.characters.count)
                let randomCharacterURL: String = episode.characters[randomIndex]
                
                
                networkService.getCharacter(urlOfCharacter: randomCharacterURL) { character, error in
                    if character == nil {
                        print("char == nil")
                    }
                    if let error = error {
                        print("Error fetching character: \(error) for \(String(describing: character))")
                        return
                    }
                    guard let character = character else {
                        print("No character found")
                        return
                    }
                    
                    
                    DispatchQueue.main.sync {
                        
                        self.characterImageService.downloadImage(url: URL(string: character.image)!) { image in
                            let characterImage = image
                            let episodeAndCharacter = EpisodeAndCharacterModel(episodeName: episode.name,
                                                                               episodeCode: episode.episode,
                                                                               characterName: character.name,
                                                                               characterImage: characterImage!,
                                                                               characterGender: character.gender,
                                                                               characterStatus: character.status,
                                                                               characterSpecies: character.species,
                                                                               characterOrigin: character.origin,
                                                                               characterType: character.type,
                                                                               characterLocation: character.location)
                            self.episodesWithCharacterArray.append(episodeAndCharacter)
                            print(episodeAndCharacter.episodeCode)
                            if self.episodesWithCharacterArray.count == self.episodesArray.count {
                                self.dataSourceArray.value = self.episodesWithCharacterArray
                                
                                //print(self.episodesWithCharacterArray[0])
                            }
                        }
                    }
               }
                
                //charactersArray.append(randomCharacterURL)
            }
        }
    }
    
    
    
//    //для каждого эпизода выбрать одного персонажа
//    func getRandomCharacterForEpisode() {
//        if !episodesArray.isEmpty {
//            episodesArray.forEach { episode in
//                let randomIndex = Int.random(in: 0..<episode.characters.count)
//                let randomCharacterURL: String = episode.characters[randomIndex]
//                var dict: [String:String] = [:]
//                dict = [episode.episode:randomCharacterURL]
//                print(dict)
//                charactersArray.append(randomCharacterURL)
//            }
//        }
//    }
    
    //собрать новый массив типа [эпизод + персонаж]
    func makeEpisodesWithCharacterArray() {
        if episodesArray.count == charactersArray.count {
            for episodeIndex in 0...episodesArray.count-1 {
                let episode = episodesArray[episodeIndex]
                let character = charactersArray[episodeIndex]
                networkService.getCharacter(urlOfCharacter: character) { character, error in
                    if character == nil {
                        print("char == nil")
                    }
                    if let error = error {
                        print("Error fetching character: \(error) for \(String(describing: character))")
                        return
                    }
                    guard let character = character else {
                        print("No character found")
                        return
                    }
                    
                    
                    DispatchQueue.main.async {
                        
                        self.characterImageService.downloadImage(url: URL(string: character.image)!) { image in
                            let characterImage = image
                            let episodeAndCharacter = EpisodeAndCharacterModel(episodeName: episode.name,
                                                                               episodeCode: episode.episode,
                                                                               characterName: character.name,
                                                                               characterImage: characterImage!,
                                                                               characterGender: character.gender,
                                                                               characterStatus: character.status,
                                                                               characterSpecies: character.species,
                                                                               characterOrigin: character.origin,
                                                                               characterType: character.type,
                                                                               characterLocation: character.location)
                            self.episodesWithCharacterArray.append(episodeAndCharacter)
                            print(episodeAndCharacter.episodeCode)
                            if self.episodesWithCharacterArray.count == self.episodesArray.count {
                                self.dataSourceArray.value = self.episodesWithCharacterArray
                                
                                //print(self.episodesWithCharacterArray[0])
                            }
                        }
                    }
                }
                
            }
        }
    }
    
}




/*
 
 class EpisodesViewModel {
     let episodeStorage: UserDefaultsRepositoryProtocol
     let networkService: NetworkServiceProtocol
     let characterImageService: CharacterImageServiceProtocol
     var episodesArray: [Episode] = []
     var charactersArray: [String] = []
     var episodesWithCharacterDict: [Int:EpisodeAndCharacterModel] = [:]
     var dataSourceArray: Observable<[EpisodeAndCharacterModel]> = Observable(nil)

     var tempDict: [String:String] = [:]

     init(_ dependencies: DependenciesProtocol) {
         episodeStorage = dependencies.userDefaultsRepository
         networkService = dependencies.networkService
         characterImageService = dependencies.characterImageService
     }

     func getEpisodes() {
         networkService.getEpisodes { episodes, error in
             if let error = error {
                 print("Error fetching episodes: \(error)")
                 return
             }
             guard let episodes = episodes else {
                 print("No episodes found")
                 return
             }
             self.episodesArray = episodes
             self.getRandomCharacterForEpisode()
         }
     }

     func getRandomCharacterForEpisode() {
         if !episodesArray.isEmpty {
             for (index, episode) in episodesArray.enumerated() {
                 let randomIndex = Int.random(in: 0..<episode.characters.count)
                 let randomCharacterURL: String = episode.characters[randomIndex]

                 networkService.getCharacter(urlOfCharacter: randomCharacterURL) { character, error in
                     if character == nil {
                         print("char == nil")
                     }
                     if let error = error {
                         print("Error fetching character: \(error) for \(String(describing: character))")
                         return
                     }
                     guard let character = character else {
                         print("No character found")
                         return
                     }

                     DispatchQueue.main.async {
                         self.characterImageService.downloadImage(url: URL(string: character.image)!) { image in
                             let characterImage = image
                             let episodeAndCharacter = EpisodeAndCharacterModel(episodeName: episode.name,
                                                                               episodeCode: episode.episode,
                                                                               characterName: character.name,
                                                                               characterImage: characterImage!,
                                                                               characterGender: character.gender,
                                                                               characterStatus: character.status,
                                                                               characterSpecies: character.species,
                                                                               characterOrigin: character.origin,
                                                                               characterType: character.type,
                                                                               characterLocation: character.location)
                             self.episodesWithCharacterDict[index] = episodeAndCharacter
                             print(episodeAndCharacter.episodeCode)
                             if self.episodesWithCharacterDict.count == self.episodesArray.count {
                                 let sortedEpisodesWithCharacterArray = Array(self.episodesWithCharacterDict.values.sorted(by: { $0.key < $1.key }))
                                 self.dataSourceArray.value = sortedEpisodesWithCharacterArray
                             }
                         }
                     }
                 }
             }
         }
     }
 }
 */
