//: Playground - noun: a place where people can play

import UIKit


protocol MoveStrategyProtocol{
    func performMove()
}

class AbstractObjectThatMove{
    
    private var strategy : MoveStrategyProtocol!
    var whoAmI : String = "Unknow Object"
    
    required init(strategy : MoveStrategyProtocol){
        self.strategy = strategy
    }
    
    func move(){
        strategy.performMove()
    }
    
    internal var WhoAmI : String{
        get{
            return whoAmI
        }
        set{
            whoAmI = newValue
        }
    }
    
}

class Human : AbstractObjectThatMove {
    required init(strategy : MoveStrategyProtocol){
        super.init(strategy : strategy)
        self.WhoAmI = "I'm a human"
    }
}

class Rabbit : AbstractObjectThatMove{
    required init(strategy : MoveStrategyProtocol){
        super.init(strategy: strategy)
        self.WhoAmI = "I'm a rabbit"
    }
}

class Bird : AbstractObjectThatMove{
    required init(strategy : MoveStrategyProtocol){
        super.init(strategy: strategy)
        self.WhoAmI = "I'm a bird"
    }
}

class WalkMoveStrategy : MoveStrategyProtocol{
    func performMove() {
        print("I am walking")
        
    }
}

class RunMoveStrategy : MoveStrategyProtocol{
    func performMove() {
        print("I am runnung")
        
    }
}

class FlyMoveStrategy : MoveStrategyProtocol{
    func performMove() {
        print("I am flying")
        
    }
}

let strategyForHuman = WalkMoveStrategy()
let human = Human(strategy : strategyForHuman)
print(human.whoAmI)
human.move()