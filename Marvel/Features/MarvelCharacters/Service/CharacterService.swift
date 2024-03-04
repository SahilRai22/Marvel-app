//
//  API.swift
//  Marvel
//
//  Created by Sahil Rai on 27/02/2024.
//

import Foundation

protocol CharacterService {
    func fetchMarvelCharacterData() async throws -> [CharacterData]
}

class CharacterServiceImpl: CharacterService {
    var characterData: [CharacterData]  = []
    
    func fetchMarvelCharacterData() async throws -> [CharacterData] {
        
        let characterURL = MarvelAPI.EndPoints.getCharacters.rawValue
        let url = URL(string: characterURL)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)
            let response = try JSONDecoder().decode(CharacterData.self, from: data)
            
            return [response]
        } catch {
            print("Failed to decode Character Data with error:", error)
        }
    return []
    }
}
