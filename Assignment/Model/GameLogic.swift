//
//  GameLogic.swift
//  Assignment
//
//  Created by Akshay Kumar on 09/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import Foundation
class Game {
    let width: Int
    let height: Int
      var currentState: GameState
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        let cells = Array(repeating: Cell.makeDeadCell(), count: width*height)
        currentState = GameState(cells: cells)
    }
    
    func generateDummyData() -> GameState {
        let initialStatePoints = [1,16, 31, 96, 97, 111, 112, 20, 21, 36, 37, 137, 153, 168, 167,
                                  156, 172, 187, 158, 173, 213, 214, 41, 56, 71, 76, 91, 92, 107,
                                  116, 131, 101, 162, 163, 177, 178, 17, 117
        ]
        for point in initialStatePoints{
            currentState[point] = Cell.makeLiveCell()
        }
        return self.currentState
    }
  
    
}
