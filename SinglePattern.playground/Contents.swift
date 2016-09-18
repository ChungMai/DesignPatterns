//: Playground - noun: a place where people can play

import UIKit

class BoardGameManager{
    static let sharedInstance = BoardGameManager()
    var name : String?
    
    init(){
        print("Singleton initialized")
    }
}


let boardGame = BoardGameManager.sharedInstance
boardGame.name = "Board Game Manager 1"

let b = BoardGameManager.sharedInstance
b.name = "Chung Mai"

print(boardGame.name!)
