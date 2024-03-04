//
//  SplashView.swift
//  Marvel
//
//  Created by Sahil Rai on 23/02/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                CharacterListView().preferredColorScheme(.dark)
            } else {
                Rectangle()
                    .background(Color.black)
                
                Image("Marvel_intro")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1000, height: 1000)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
