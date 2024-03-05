//
//  ComicCardView.swift
//  Marvel
//
//  Created by Sahil Rai on 26/02/2024.
//

import SwiftUI

struct ComicCardView: View {
    let result: Comics
    @State private var isExpanded = false
    
    var body: some View {
        let comicThumbnailPathHTTP = "\(result.thumbnail.path).\(result.thumbnail.extension)"
        let comicThumbnailPathHTTPS = "https" + comicThumbnailPathHTTP.dropFirst(4)
        
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                AsyncImage( url: URL(string: comicThumbnailPathHTTPS)) {
                    image in image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                
                Text("\(result.title)")
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.bold)
                    .lineLimit(isExpanded ? nil : 1)
  
                    Text("Issue number: \(result.issueNumber)")
                        .font(.custom("Avenir", size: 10))
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        Text(isExpanded ? "^" : "⌄")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .padding(10)
     
            .frame(width: 150, height: 300)
            .padding([.bottom, .trailing], 10)
            .hoverEffect(.lift)
        
        }
    }


#Preview {
    ComicCardView(result: Comics.init(
        id: 24571,
        digitalID: 0,
        title: "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)",
        issueNumber: 14,
        thumbnail: ComicThumbnail.init(
            path: "http://i.annihil.us/u/prod/marvel/i/mg/a/30/4e948fb5e9b52",
            extension: "jpg")))
}
