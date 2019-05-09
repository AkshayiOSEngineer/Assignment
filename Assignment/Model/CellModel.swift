//
//  CellModel.swift
//  Assignment
//
//  Created by Akshay Kumar on 09/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//

import Foundation
import Foundation

struct Cell {
    var isAlive: Bool = false
    
    static func makeDeadCell() -> Cell {
        return Cell(isAlive: false)
    }
    
    static func makeLiveCell() -> Cell {
        return Cell(isAlive: true)
    }
}
