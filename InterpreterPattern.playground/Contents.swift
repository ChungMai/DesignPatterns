//: Playground - noun: a place where people can play

import UIKit

extension String{
    func subStringFrom(pos : Int) -> String{
        var subString = ""
        let startIndex = self.startIndex.advancedBy(pos)
        let endIndex = self.endIndex
        let range = startIndex..<endIndex
        subString = self[range]
        return subString
    }
}


class Context{
    var input : String!
    var output = 0
    
    init(input : String){
        self.input = input
    }
}

class Expression{
    func interpret(context : Context){
        if context.input.characters.count == 0{
            return
        }
        
        if context.input.hasPrefix(nine()){
            context.output = context.output + (9 * multiplier())
            context.input = context.input.subStringFrom(2)
        } else if context.input.hasPrefix(four()){
            context.output = context.output + (4 * multiplier())
            context.input = context.input.subStringFrom(2)
        } else if context.input.hasPrefix(five()){
            context.output = context.output + (5 * multiplier())
            context.input = context.input.subStringFrom(1)
        }
        while context.input.hasPrefix(one()) {
            context.output = context.output + (1 * multiplier())
            context.input = context.input.subStringFrom(1)
        }
    }
    
    func one() -> String {
        fatalError("this method must be implemented in a subclass")
    }
    
    func four() -> String {
        fatalError("this method must be implemented in a subclass")
    }
    
    func five() -> String {
        fatalError("this method must be implemented in a subclass")
    }
    
    func nine() -> String {
        fatalError("this method must be implemented in a subclass")
    }
    
    func multiplier() -> Int {
        fatalError("this method must be implemented in a subclass")
    }
}

class ThounsandExpress : Expression{
    override func one() -> String {
        return "M"
    }
    
    override func four() -> String {
        return " "
    }
    
    override func five() -> String {
        return " "
    }
    
    override func nine() -> String {
        return " "
    }
}

class HundredExpress : Expression{
    
}