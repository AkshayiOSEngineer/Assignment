//
//  Track.swift
//  Assignment
//
//  Created by Akshay Kumar on 09/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import Foundation
struct GameState  {
      var cells: [Cell] = []
    subscript(index: Int) -> Cell {
        get {
            return cells[index]
        } set {
            cells[index] = newValue
        }
    }
}
