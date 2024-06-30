//
//  CharacterModel.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 26.04.2024.
//

import Foundation

// MARK: - Character
struct Character: Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
