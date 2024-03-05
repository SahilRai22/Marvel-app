//
//  CharacterInformationView.swift
//  Marvel
//
//  Created by Sahil Rai on 23/02/2024.
//

import SwiftUI

struct CharacterDescriptionView: View {
    let result: Characters
    
    @StateObject var comicViewModel: ComicViewModel
    
    init(result: Characters) {
        self.result = result
        self._comicViewModel = StateObject(wrappedValue: ComicViewModel(
            result: result,
            service: ComicServiceImpl()
        ))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CharacterHeaderView(result: result)
                .frame(height: 400)

            VStack{
                VStack(alignment: .leading) {
                    Text(result.name)
                        .font(.custom("Avenir", size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(5)
                    
                    Text("Character ID: \(result.id)")
                        .font(.custom("Avenir", size: 10))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(5)
                
                    Text(result.description)
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(Color.white)
                        .padding(5)
                    
                    Divider()
                    
                    Text("Comics")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(5)
                    
                }.padding(10)

            }
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
