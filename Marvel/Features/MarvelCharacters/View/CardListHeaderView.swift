//
//  CardListHeaderView.swift
//  Marvel
//
//  Created by Sahil Rai on 29/02/2024.
//

import SwiftUI

struct CardListHeaderView: View {
    func calculateHeaderHeight(with geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        let height = geometry.size.height
        let headerHeight = height + offset
        
        return max(headerHeight, 0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            Image("Marvel_Header")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: calculateHeaderHeight(with: geometry))
                .clipped()
                .offset(y: -geometry.frame(in: .global).minY)
        }
    }
}

#Preview {
    CardListHeaderView()
}
