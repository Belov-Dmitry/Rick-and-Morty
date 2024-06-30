//
//  DetailsViewModel.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 23.06.2024.
//

import Foundation
import UIKit

class DetailsViewModel {
    
    let characterName: String
    let characterStatus: String
    let characterSpecies: String
    let characterType: String
    let characterGender: String
    let characterOrigin: String
    let characterLocation: String
    let characterImage: UIImage
    var detailsData: [EpisodeAndCharacterModel] = []
    
    
    init(character: EpisodeAndCharacterModel) {
        self.characterName = character.characterName
        self.characterStatus = character.characterStatus
        self.characterSpecies = character.characterSpecies
        self.characterType = character.characterType
        self.characterGender = character.characterGender
        self.characterOrigin  = character.characterOrigin.name
        self.characterLocation  = character.characterLocation.name
        self.characterImage = character.characterImage
        
        let characterData = EpisodeAndCharacterModel(episodeName: character.episodeName,
                                                   episodeCode: character.episodeCode,
                                                   characterName: character.characterName,
                                                   characterImage: character.characterImage,
                                                   characterGender: character.characterGender,
                                                   characterStatus: character.characterStatus,
                                                   characterSpecies: character.characterSpecies,
                                                   characterOrigin: character.characterOrigin,
                                                   characterType: character.characterType,
                                                   characterLocation: character.characterLocation)
        detailsData.append(characterData)
    }
    
    
    
    
    
    
    
    
}
