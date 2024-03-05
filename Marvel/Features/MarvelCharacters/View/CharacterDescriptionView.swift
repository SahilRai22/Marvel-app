//
//  CharacterInformationView.swift
//  Marvel
//
//  Created by Sahil Rai on 23/02/2024.
//

import SwiftUI

extension Text {
    func styling() -> some View {
        self
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(5)
    }
}

struct CharacterDescriptionView: View {
    let result: Characters
    
    @StateObject var comicViewModel: ComicViewModel
    
    init(result: Characters) {
        self.result = result
        self._comicViewModel = StateObject(wrappedValue: ComicViewModel(
            result: result,
            service: ComicServiceImpl()))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CharacterHeaderView(result: result)
                .frame(height: 400)

            VStack{
                VStack(alignment: .leading) {
                    Text(result.name)
                        .font(.custom("Avenir", size: 20))
                        .styling()
    
                    Text("Character ID: \(result.id)")
                        .font(.custom("Avenir", size: 12))
                        .styling()
                    
                    Text(result.description)
                        .font(.custom("Avenir", size: 12))
                        .styling()

                    Divider()
                    
                    Text("Comics")
                        .font(.custom("Avenir", size: 14))
                        .styling()
                }.padding(10)
            }
            
            ComicListView(comicViewModel: comicViewModel)
        }
        .background(Color(red: 0.071, green: 0.071, blue: 0.071))
        .navigationBarTitleDisplayMode (.inline)
        .edgesIgnoringSafeArea(.top)
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
                        ])))
}
