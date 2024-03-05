//
//  ComicViewModel.swift
//  Marvel
//
//  Created by Sahil Rai on 26/02/2024.
//

import Foundation

@MainActor
class ComicViewModel: ObservableObject {
    @Published var comicData: [ComicData] = []
    @Published var state: StateMachine = .loading
    
    var characterItems: [ComicsItem]
    private var loadData: Bool = false
    
    init(result: Characters, service: ComicService) {
        characterItems = result.comics.items
       
        Task.init {
                for item in characterItems {
                    do {
                        state = .loading
                        let resourceURIHTTP = "\(item.resourceURI)"
                        let resourceURIHTTPS = "https" + resourceURIHTTP.dropFirst(4)
                        
                        let comics = try await service.fetchComicData(resourceURI: resourceURIHTTPS)
                        state = .success
                        comicData.append(contentsOf: comics)
                    
                    } catch {
                        state = .error(error: error)
                        print(String(describing: error))
                    }
                }

        }
    }
}
