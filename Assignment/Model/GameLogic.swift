//
//  GameLogic.swift
//  Assignment
//
//  Created by Akshay Kumar on 09/05/19.
//  Copyright © 2019 Akshay Kumar. All rights reserved.
//
import Foundation
typealias GameStateObserver = ((GameState) -> Void)?
class Game {
    let width: Int
    let height: Int
    var currentState: GameState
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        let cells = Array(repeating: Cell.makeDeadCell(), count: width*height)
        currentState = GameState(cells: cells)
        print(width)
        print(height)
        
    }
    /*
     Dummy Data On Intial State
     */
    func generateDummyData() -> GameState {
        let initialStatePoints = [1,16, 31, 96, 97, 111, 112, 20, 21, 36, 37, 137, 153, 168, 167,
                                  156, 172, 187, 158, 173, 213, 214, 41, 56, 71, 76, 91, 92, 107,
                                  116, 131, 101, 162, 163, 177, 178, 17, 117
        ]
        print(initialStatePoints.count)
        for point in initialStatePoints{
            currentState[point] = Cell.makeLiveCell()
        }
     
        return self.currentState
    }
    func addStateObserverToNotifyView(_ observer: GameStateObserver) {
        observer?(generateDummyData())
        Timer.scheduledTimer(withTimeInterval: 0.33, repeats: true) { _ in
            
            observer?(self.iterate())
        }
    }
    
    func iterate() -> GameState  {
        var nextState = currentState
         print("width--->",width)
         print("height--->",height)
        for i in 0...width - 1 {
            for j in 0...height - 1 {
                let positionInTheArray = j*width + i
                print("----positionInTheArray--->",positionInTheArray)
                nextState[positionInTheArray] = Cell(isAlive: state(x: i, y: j))
            }
        }
        self.currentState = nextState
        return nextState
    }
    
    func state(x: Int, y: Int) -> Bool {
        var numberOfAliveNeighbours = 0
        let previousPosition = x + y*width
        for i in x-1...x+1 {
            for j in y-1...y+1 {
                let positionInTheArray = j*width + i
                guard positionInTheArray >= 0 && positionInTheArray < width*height && previousPosition != positionInTheArray else {continue}
                if currentState[positionInTheArray].isAlive {
                    numberOfAliveNeighbours += 1
                }
            }
        }
        
        let wasPrevioslyAlive = currentState[previousPosition].isAlive
        if wasPrevioslyAlive {
            return numberOfAliveNeighbours == 2 || numberOfAliveNeighbours == 3
        } else {
            //Dead
            return numberOfAliveNeighbours == 3
        }
    }
  
    
    
}
