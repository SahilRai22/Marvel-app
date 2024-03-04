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
    
    private let service: CharacterService
    
    
    private var loadData: Bool = false
    
    init(service: CharacterService) {
        self.service = service
        
        Task.init {
            self.loadData = true
            
            if self.loadData {
                do {
                    self.characterData = try await service.fetchMarvelCharacterData()
                    print("Api fetching successfully")
                } catch {
                    print(String(describing: error))
                }
            }
            else {
                print("CharacterViewModel loadData flag: \(loadData) - data not loading to view")
            }
        }

    }
}
