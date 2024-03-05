//
//  GeometricHeaderHelper.swift
//  Marvel
//
//  Created by Sahil Rai on 05/03/2024.
//

import Foundation
import SwiftUI

class GeometricHeaderHelper {
    func calculateHeaderHeight(with geometry: GeometryProxy) -> CGFloat {
        let offset = geometry.frame(in: .global).minY
        let height = geometry.size.height
    
        let headerHeight = height + offset
    
        return max(headerHeight, 0)
    }
    
}
