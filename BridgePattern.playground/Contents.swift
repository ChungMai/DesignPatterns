//: Playground - noun: a place where people can play

import UIKit

protocol IAbstractBridge{
    var concreteImplement : ImplementationBase {get set}
    func turnOn()
}


protocol ImplementationBase{
        func run()
}

class RemoteControl : IAbstractBridge{

    var concreteImplement: ImplementationBase
    
    init(impl: ImplementationBase) {
        self.concreteImplement = impl
    }
 
    func turnOn() {
        self.concreteImplement.run()
    }
}

class TV : ImplementationBase{
    func run() {
        print("TV turned on")
    }
}


class Light : ImplementationBase{
    func run() {
        print("Light turned on")
    }
}

let tvRemoteControl = RemoteControl(impl:TV())
tvRemoteControl.turnOn()

let lightRemoteControl = RemoteControl(impl: Light())
lightRemoteControl.turnOn()
