//
//  CharacterView.swift
//  Marvel
//
//  Created by Sahil Rai on 19/02/2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var characterViewModel = CharacterViewModel(
        service: CharacterServiceImpl()
    )
    
    init(result: Characters? = nil) {
        self._characterViewModel = StateObject(wrappedValue: CharacterViewModel(
            service: CharacterServiceImpl()
        ))
    }
    //concatent the thumbnail
    
    var body: some View  {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                CardListHeaderView()
                    .frame(width: 500, height: 300)
                
                Spacer()
                
                switch characterViewModel.state {
                case .success:
                    if characterViewModel.characterData.isEmpty {
                        Text("No characters found")
                    } else {
                        VStack(alignment: .leading, spacing: 2) {
                            
                            Text("Characters")
                                .foregroundColor(.white)
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.heavy)
                                .padding(20)
                            
                            ForEach(characterViewModel.characterData, id: \.self) { characterData in
                                ForEach(characterData.data.results, id: \.id) { result in
                                    NavigationLink(destination: CharacterDescriptionView(result: result)) {
                                        CharacterCardView(result: result).preferredColorScheme(.dark)
                                    }
                                    .hoverEffect(.lift)
                                }
                            }
                        }
                        .background(Color(red: 0.071, green: 0.071, blue: 0.071))
                        .navigationBarHidden(true)
                        .edgesIgnoringSafeArea(.top)
                    }
                case .loading:
                    ProgressView()
                case .error(error: let error):
                    Text("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func calculateHeaderHeight(with geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        let height = geometry.size.height
    
        let headerHeight = height + offset
    
        return max(headerHeight, 0)
    }
    
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(result: Characters.init(
            id: 1017100,
            name: "A-Bomb (HAS)",
            description: """
            Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate!
            Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful
            as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!
            """,
            thumbnail: CharacterThumbnail.init(
                path:  "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", extension: ".jpg"
                            ),
            comics: ComicsPath(items:
                                [ComicsItem.init(
                                    resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                                    name: "Avengers: The Initiative (2007) #14")
                                ])))
    }

}
