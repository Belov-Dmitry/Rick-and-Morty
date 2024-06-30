//
//  EpisodeModel.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 26.04.2024.
//

import Foundation

// MARK: - Welcome
struct EpisodeResponse: Decodable {
    var results: [Episode]
}

// MARK: - Result
struct Episode: Decodable {
    let id: Int
    let name: String
    let air_Date: String?
    let episode: String
    var characters: [String]
    let url: String
    let created: String
}
