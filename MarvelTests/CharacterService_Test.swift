//
//  MarvelAPITests.swift
//  MarvelTests
//
//  Created by Sahil Rai on 26/02/2024.
//

import XCTest
@testable import Marvel

final class CharacterService_Test: XCTestCase {

    var characterService: CharacterService!
    
    @MainActor override func setUp() {
            super.setUp()
        characterService = CharacterServiceImpl()
        }
        override func tearDown() {
            
            super.tearDown()
        }
    
    func test_CharacterViewModel_fetchAPI_shouldGiveResponse() async throws {
        
        let expectation = XCTestExpectation(description: "Fetch Marvel Character Data")
        
        do {
            let characterData = try await characterService.fetchMarvelCharacterData()
            XCTAssertFalse(characterData.isEmpty, "Character data should not be empty")
            expectation.fulfill()
        } catch {
            XCTFail("Failed to fetch Marvel character data with error: \(error)")
        }
    }
}
