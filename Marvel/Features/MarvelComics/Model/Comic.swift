//
//  Comic.swift
//  Marvel
//
//  Created by Sahil Rai on 26/02/2024.
//

import Foundation

// MARK: - Comic
struct ComicData: Codable, Hashable {
    let code: Int
    let data: ComicResult
}

// MARK: - DataClass
struct ComicResult: Codable,Hashable {
    let results: [Comics]
}

// MARK: - Comics
struct Comics: Codable, Hashable, Identifiable {
    let id: Int
    let digitalID: Int?
    let title: String
    let issueNumber: Int
    let thumbnail: ComicThumbnail
}

// MARK: - Thumbnail
struct ComicThumbnail: Codable, Hashable {
    let path: String
    let `extension`: String
}
