//
//  ComicListView.swift
//  Marvel
//
//  Created by Sahil Rai on 05/03/2024.
//

import SwiftUI

struct ComicListView: View {
    @StateObject var comicViewModel: ComicViewModel

    var body: some View {
        switch comicViewModel.state {
        case .success:
            if comicViewModel.comicData.isEmpty{
                Text("Comic data is empty")
            }
            else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                        ForEach(comicViewModel.comicData, id: \.self) { comicData in
                            ForEach(comicData.data.results, id: \.id) { comic in
                                ComicCardView(result: comic)
                            }
                        }
                    }
                }
            }
        case .loading:
            ProgressView()
        case .error(error: let error):
            Text("Error: \(error.localizedDescription)")
        }
    }
}
