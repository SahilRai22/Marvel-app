//
//  APIHash.swift
//  Marvel
//
//  Created by Sahil Rai on 29/02/2024.
//

import Foundation
import CryptoKit


func hashData(data: Data) -> String {
    let hashedData = Insecure.MD5.hash(data: data)
    let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
    return hashString
}

struct APIHash {
    static let pathToEncrpyt = "\(APIKey.timeStamp)\(APIKey.privateKey)\(APIKey.publicKey)".data(using: .utf8)!
    static let MD5Digest = hashData(data: pathToEncrpyt)
    
    public static var encryptedURL: String {
          return "?ts=\(APIKey.timeStamp)&apikey=\(APIKey.publicKey)&hash=\(MD5Digest)"
      }
}
