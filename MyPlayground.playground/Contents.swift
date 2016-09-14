//: Playground - noun: a place where people can play

import UIKit

struct GameState{
    var level : Int
    var weapon : String
    var points : Int
}


protocol Originator {
    func createMemento() -> GameMemento
    func setMemento(memento : GameMemento)
}

struct GameMemento{
    private let entries : [Int : GameState]
    private let nextId : Int
    private let totalPoints : Int
    
    init (checkPoint : CheckPoint){
        self.entries = checkPoint.entries
        self.nextId = checkPoint.nextId
        self.totalPoints = checkPoint.totalPoints
    }
    
    func apply(checkPoint: CheckPoint) {
        print("Restoring a game state to a checkpoint...")
        checkPoint.nextId = nextId
        checkPoint.totalPoints = totalPoints
        checkPoint.entries = entries
    }
}

class CheckPoint : Originator{
    private var entries : [ Int : GameState] = [:]
    private var totalPoints : Int = 0
    private var nextId : Int = 0
    
    func createMemento() -> GameMemento {
        return GameMemento(checkPoint : self)
    }
    
    func setMemento(memento: GameMemento) {
        memento.apply(self)
    }
    
    func addGameStateEntry(level : Int, weapon : String, points : Int){
        let entry = GameState(level: level, weapon: weapon, points: points)
        entries[nextId] = entry
        nextId += 1
        totalPoints += points
    }
    
    func printCheckPoint(){
        print("Printing checkPoint ...")
        entries.sort {$0.0 < $1.0}.map{
            print("Level: \($0.1.level) Weapon: \($0.1.weapon) Points: \($0.1.points) ")
        }
        print("Total Points: \(totalPoints)\n")
    }
}

let checkPoint = CheckPoint()
checkPoint.addGameStateEntry(0, weapon: "gun", points: 1200)
checkPoint.addGameStateEntry(1, weapon: "tommy gun", points: 2250)
checkPoint.addGameStateEntry(2, weapon: "bazooka", points: 2400)
checkPoint.addGameStateEntry(4, weapon: "knife", points: 3000)
checkPoint.printCheckPoint()

let memento = checkPoint.createMemento()

let checkPoint1 = CheckPoint()
checkPoint1.setMemento(memento)
checkPoint1.printCheckPoint()