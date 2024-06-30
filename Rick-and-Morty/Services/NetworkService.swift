//
//  NetworkService.swift
//  Rick-and-Morty
//
//  Created by Dmitry Belov on 26.04.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getEpisodes(completion: @escaping ([Episode]?, Error?) -> Void)
    func getCharacter(urlOfCharacter: String , completion: @escaping (Character?, Error?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    let baseUrl = "https://rickandmortyapi.com/api"
    
    func getEpisodes(completion: @escaping ([Episode]?, Error?) -> Void) {
        let url = "\(baseUrl)/episode"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data found in response"])
                completion(nil, error)
                return
            }
            
            do {
                let episodes = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                completion(episodes.results, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    func getCharacter(urlOfCharacter: String , completion: @escaping (Character?, Error?) -> Void) {
        guard let url = URL(string: urlOfCharacter) else { return }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "com.example.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data found in response"])
                    completion(nil, error)
                    return
                }
                
                do {
                    let character = try JSONDecoder().decode(Character.self, from: data)
                    completion(character, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
        }
    
}

