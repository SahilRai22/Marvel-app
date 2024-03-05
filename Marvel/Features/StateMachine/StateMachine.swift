//
//  CharacterState.swift
//  Marvel
//
//  Created by Sahil Rai on 04/03/2024.
//

import Foundation

enum StateMachine {
    case success
    case loading
    case error(error: Error)
}
