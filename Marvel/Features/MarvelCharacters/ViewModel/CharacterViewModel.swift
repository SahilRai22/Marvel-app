//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Sahil Rai on 19/02/2024.
//

import Foundation
import Combine

@MainActor // anything that updates the UI needs to be run on main thread
public class CharacterViewModel: ObservableObject {
    @Published var characterData: [CharacterData] = [CharacterData]()
    @Published var state: StateMachine = .loading
    
    private let service: CharacterService
    
    
    init(service: CharacterService) {
        self.service = service
        fetchCharacter()
    }
    
    private func fetchCharacter(){
        Task.init {
                do {
                    state = .loading
                    self.characterData = try await service.fetchMarvelCharacterData()
                    state = .success
                    print("Api fetching successfully")
                } catch {
                    state = .error(error: error)
                    print(String(describing: error))
                }
        }
    }
}
