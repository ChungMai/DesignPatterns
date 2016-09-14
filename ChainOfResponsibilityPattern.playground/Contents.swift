//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Logger{
    static var ERROR = 1
    static var INFO = 2
    static var DEBUG = 3
    
    var mask : Int?
    var next : Logger?
    
    func nextHandler(nextLogger : Logger) -> Logger?{
        next = nextLogger
        return next
    }
    func message (message : String, priority : Int){
        if priority <= mask{
            writeMessage(message)
        }
        
        if let next = next{
            next.message(message, priority: priority)
        }
    }
    
    func writeMessage(message : String) {
        preconditionFailure("Must be overriden")
    }
    
    static func prepareDefaultChain() -> Logger?{
        var l : Logger?
        var l1 : Logger?
        
        l = StdOutLogger(mask : Logger.DEBUG)
        l1 = l!.nextHandler(EmailLogger(mask: Logger.INFO))
        l1 = l1!.nextHandler(ErrLogger(mask : Logger.ERROR))
        return l
    }
}

class StdOutLogger : Logger{
    init(mask : Int){
        super.init()
        self.mask = mask
    }
    
    override func writeMessage(message: String) {
        print("Sending to StdOutLogger: \(message)")
    }
}

class EmailLogger : Logger{
    init(mask : Int) {
        super.init()
        self.mask = mask
    }
    
    override func writeMessage(message: String) {
        print("Sending by Email: \(message)")
    }
}

class ErrLogger : Logger{
    init(mask : Int) {
        super.init()
        self.mask = mask
    }
    
    override func writeMessage(message: String) {
        print("Sending by ErrorLogger: \(message)")
    }
}

var l : Logger?
l = Logger.prepareDefaultChain()
l?.message("Entering the func Y()", priority: Logger.ERROR)