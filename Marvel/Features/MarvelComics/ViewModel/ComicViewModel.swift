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
    
    var characterItems: [ComicsItem]
    private var loadData: Bool = false
    
    init(result: Characters, service: ComicService) {
        characterItems = result.comics.items
    
        Task.init {
            self.loadData = true
            
            if self.loadData {
                for item in characterItems {
                    do {
                        let resourceURIHTTP = "\(item.resourceURI)"
                        let resourceURIHTTPS = "https" + resourceURIHTTP.dropFirst(4)
                        
                        let comics = try await service.fetchComicData(resourceURI: resourceURIHTTPS)
                        comicData.append(contentsOf: comics)
                    } catch {
                        print(String(describing: error))
                    }
                }
            }
            else {
                print("ComicViewModel loadData flag: \(loadData) - data not loading to view")
            }
        }
    }
}
