//
//  ComicService.swift
//  Marvel
//
//  Created by Sahil Rai on 28/02/2024.
//

import Foundation

protocol ComicService {
    func fetchComicData(resourceURI: String) async throws -> [ComicData]
}

class ComicServiceImpl: ComicService {

    func fetchComicData(resourceURI: String) async throws -> [ComicData] {

        let characterURL = MarvelAPI.EndPoints.getComics(resourceURI: resourceURI).rawValue
        
       let url = URL(string: characterURL)
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)
            let response = try JSONDecoder().decode(ComicData.self, from: data)

            return [response]
        } catch {
            print("Failed to decode Comic Data with error:", error)

        }
    return []
    }
}
