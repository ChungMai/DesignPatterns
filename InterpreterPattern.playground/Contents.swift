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
    
    override func multiplier() -> Int {
        return 1000
    }
}

class HundredExpress : Expression{
    override func one() -> String {
        return "C"
    }
    
    override func four() -> String {
        return "CD"
    }
    
    override func five() -> String {
        return "D"
    }
    
    override func nine() -> String {
        return "CM"
    }
    
    override func multiplier() -> Int {
        return 100
    }
}

class TenExpress : Expression{
    override func one() -> String {
        return "X"
    }
    
    override func four() -> String {
        return "CL"
    }
    
    override func five() -> String {
        return "L"
    }
    
    override func nine() -> String {
        return "XC"
    }
    
    override func multiplier() -> Int {
        return 10
    }
}

class OneExpress : Expression{
    override func one() -> String {
        return "I"
    }
    
    override func four() -> String {
        return "IV"
    }
    
    override func five() -> String {
        return "V"
    }
    
    override func nine() -> String {
        return "IX"
    }
    
    override func multiplier() -> Int {
        return 1
    }
}

class RomanToDecimalConverter{
    static let pattern = "^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$"
    let validation = NSPredicate(format : "SELF MATCHES %@", pattern)
    var tree : [Expression] = [ThounsandExpress(), HundredExpress(), TenExpress(), OneExpress()]
    
    func calculate(romanString : String) throws -> Int {
        guard validate(romanString) else {
            throw FormatError.RomanNumberFormatError}
        let context = Context(input : romanString)
        for t in tree{
            t.interpret(context)
        }
        
        return context.output
    }
    
    func validate(romanString : String) -> Bool{
        return validation.evaluateWithObject(romanString)
    }
}

enum FormatError : ErrorType{
    case RomanNumberFormatError
}

let romanNumberToTest = ["DC", "MCCMXXVIII","MCMXXVIII"]
var converter = RomanToDecimalConverter()
for roman in romanNumberToTest {
    var decimal = try? converter.calculate(roman)
    guard (decimal != nil) else {
        print("\(roman) is not a correct roman number")
        continue
    }
    print(decimal!)
}


