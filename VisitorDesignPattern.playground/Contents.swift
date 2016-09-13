//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol CarVisitor {
    func visit(car : DSCar)
    func visit(car : RenaultCar)
    func visit(car : CitroenCar)
}

protocol Car{
    func accept(visitor : CarVisitor)
}

class DSCar : Car{
    var price = 29000.0
    func accept(visitor: CarVisitor) {
        visitor.visit(self)
    }
}

class RenaultCar : Car{
    var price = 17000.0
    func accept(visitor: CarVisitor) {
        visitor.visit(self)
    }
}

class CitroenCar : Car{
    var price = 19000.0
    func accept(visitor: CarVisitor) {
        visitor.visit(self)
    }
}

class PriceVisitor : CarVisitor{
    var price = 0.0
    func visit(car: DSCar) {
        price = car.price * 0.8
    }
    func visit(car: RenaultCar) {
        price = car.price * 0.9
    }
    
    func visit(car: CitroenCar) {
        price = car.price * 0.6
    }
}

let cars : [Car] = [DSCar(), RenaultCar(), CitroenCar()]

let prices = cars.map{(car : Car) -> Double in
    let visitors = PriceVisitor()
    car.accept(visitors)
    return visitors.price
}
