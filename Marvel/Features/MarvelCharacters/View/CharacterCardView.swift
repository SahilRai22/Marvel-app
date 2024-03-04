//
//  CharacterCardView.swift
//  Marvel
//
//  Created by Sahil Rai on 23/02/2024.
//

import SwiftUI

struct CharacterCardView: View{
    let result: Characters
 
    var body: some View {
        let characterThumbnailPathHTTP = "\(result.thumbnail.path).\(result.thumbnail.extension)"
        let characterThumbnailPathHTTPS = "https" + characterThumbnailPathHTTP.dropFirst(4)
        
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color(hue: 0.0, saturation: 0.017, brightness: 0.153, opacity: 0.919))
                .shadow(radius: 2, x: 2, y:  2)
            HStack() {
                AsyncImage( url: URL(string: characterThumbnailPathHTTPS)) {
                    image in image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading) {
                    Text("\(result.name)")
                        .font(.custom("Avenir", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        
                    Text("Description: \(result.description)")
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(SwiftUI.Color.white)
                }
            }
            .padding(10)
        }
        .frame(width: 350, height: 100)
        .padding([.bottom, .trailing], 10)
        .onTapGesture {
            print("clicked")
        }
    }
}
 
#Preview {
    CharacterCardView(result: Characters.init(
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
                            ]
                          )))
}
