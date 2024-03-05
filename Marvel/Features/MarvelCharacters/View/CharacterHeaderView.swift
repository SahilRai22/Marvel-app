//
//  CharacterHeaderView.swift
//  Marvel
//
//  Created by Sahil Rai on 29/02/2024.
//

import SwiftUI

struct CharacterHeaderView: View {
    
    let result: Characters
    
    let headerHelper = GeometricHeaderHelper()
    
    var body: some View {
        let characterThumbnailPathHTTP = "\(result.thumbnail.path).\(result.thumbnail.extension)"
        let characterThumbnailPathHTTPS = "https" + characterThumbnailPathHTTP.dropFirst(4)
        GeometryReader { geometry in
              HStack(alignment: .top) {
                  AsyncImage(url: URL(string: characterThumbnailPathHTTPS)) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: geometry.size.width, height: headerHelper.calculateHeaderHeight(with: geometry))
                          .clipped()
                          .offset(y: -geometry.frame(in: .global).minY)
                  } placeholder: {
                      ProgressView()
                  }
              }
        }
    }
}

#Preview {
    CharacterHeaderView(result: Characters.init(
        id: 1017100,
        name: "A-Bomb (HAS)",
        description: """
        Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate!
        Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful
        as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!
        """,
        thumbnail: CharacterThumbnail.init(
            path:  "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
            extension: "jpg"
        ),
        comics: ComicsPath(items:
                        [ComicsItem.init(
                            resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                            name: "Avengers: The Initiative (2007) #14")
                        ])))
}
