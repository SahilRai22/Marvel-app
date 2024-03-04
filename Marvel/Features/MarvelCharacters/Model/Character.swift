//
//  Character.swift
//  Marvel
//
//  Created by Sahil Rai on 19/02/2024.
//

import Foundation

// MARK: - CharacterData
struct CharacterData: Codable, Hashable{
    let data: CharacterResult
}

// MARK: - CharacterResult
struct CharacterResult: Codable, Hashable {
    let results: [Characters]
}

// MARK: - Characters
struct Characters: Codable, Hashable, Identifiable {
    let id: Int
    let name, description: String
    let thumbnail: CharacterThumbnail
    let comics: ComicsPath
}

// MARK: - ComicsItems
struct ComicsPath: Codable, Hashable  {
    let items: [ComicsItem]
}

// MARK: - ComicsItem
struct ComicsItem: Codable, Hashable  {
    let resourceURI: String
    let name: String
}

// MARK: - Thumbnail
struct CharacterThumbnail: Codable, Hashable {
    let path: String
    let `extension`: String
}
