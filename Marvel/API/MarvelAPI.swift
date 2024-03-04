//
//  APIManager.swift
//  Marvel
//
//  Created by Sahil Rai on 29/02/2024.
//

import Foundation
import CryptoKit

protocol API {
    static var baseURL: URL { get }
    
}

struct MarvelAPI {

    enum EndPoints: RawRepresentable, API {
        static let baseURL: URL = .init(string: "")!
        
        init?(rawValue:String) {nil}
        
        case getCharacters
        case getComics(resourceURI: String)
        
        var rawValue: String{
            switch self {
            case .getCharacters: return "https://gateway.marvel.com:443/v1/public/characters\(APIHash.encryptedURL)"
            case .getComics(let resourceURI): return "\(resourceURI)\(APIHash.encryptedURL)"
            }
        }
    }
}

extension RawRepresentable where RawValue == String, Self: API {
    
    var url: URL {
        Self.baseURL.appendingPathComponent(rawValue)
    }
    
}
