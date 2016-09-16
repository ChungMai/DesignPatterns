//: Playground - noun: a place where people can play

import UIKit

class AbstractPersonage{
    private final var fatigue = 100
    private final var money = 0
    private final var happiness = 100
    private final var hungry = 100
    private final var knowledge = 100
    private final var name : String!
    
    final var canBePaid : Bool = true
    
    required init(name:String){
        self.name = name
    }
    
    func toString() {
        print("Name: \(name) / fatigue : \(Fatigue) / happiness \(Happiness) / Hungry \(Hungry) / knowledge \(Fatigue) / money: \(Money) / ")
    }
    
    func playDay(){
        print("Play Day")
        
        print("Get up!")
        getUp()
        doWashingUp()
        
        print("Go to work")
        goToWork()
        
        print("Work")
        work()
        
        if canBePaid{
            print("Receive Pay")
            getPaid()
        }
        print("BackHome")
        backHome()
        
        print("Do personal activities")
        doPersonalActivities()
        
        print("Eat dinner")
        eatDinner()
        
        print("Sleep")
        sleep()
    }
    
    func getUp() {
        Fatigue = 0
        Happiness = 25
        Hungry = -25
        Knowledge = 0
    }
    func eatBreakfast() {
        Fatigue = -5
        Happiness = 25
        Hungry = 60
        Knowledge = 0
    }
    
    final func doWashingUp() {
        print("do washing up")
    }
    func goToWork() {
        Fatigue = -15
        Happiness = -15
        Hungry = -10
        Knowledge = 0
    }
    func work(){
        Fatigue = -40
        Happiness = -25
        Hungry = -40
        Knowledge = 25
    }
    func getPaid() {
        Money = 1000
    }
    func backHome() {
        Fatigue = -15
        Happiness = 10
        Hungry = -10
        Knowledge = 0
    }
    func doPersonalActivities() {
        Fatigue = -15
        Happiness = 15
        Hungry = -10
        Knowledge = 0
    }
    
    func eatDinner() {
        Fatigue = -10
        Happiness = 5
        Hungry = 40
        Knowledge = 0
    }
    func sleep() {
        Fatigue = 90
        Happiness = 0
        Hungry = -5
        Knowledge = 2
    }
    
    var Fatigue: Int {
        get{
            return fatigue
        }
        set{
            fatigue += newValue
        }
    }
    var Hungry: Int {
        get{
            return hungry
        }
        set{
            hungry += newValue
        }
    }
    var Happiness: Int {
        get{
            return happiness
        }
        set{
            happiness += newValue
        }
    }
    var Money: Int {
        get{
            return money
        }
        set{
            money += newValue
        }
    }
    var Knowledge: Int {
        get{
            return knowledge
        }
        set{
            knowledge += newValue
        }
    }
}

class Student: AbstractPersonage {
    required init(name: String) {
        super.init(name: name)
        //student cannot be paid
        canBePaid = false
    }
    override func doPersonalActivities() {
        //student Read Books during its personal activities
        //so life indicators must be updated
        Fatigue = -5
        Happiness = 15
        Hungry = -5
        Knowledge = 15
    }
}

class Searcher: AbstractPersonage {
    override func getPaid() {
        Money = 3000/30
    }
    override func sleep() {
        //Searcher sleep very well
        Fatigue = 90
        Happiness = 0
        Hungry = -5
        Knowledge = 10
    }
    override func doPersonalActivities() {
        //Searcher Read ScientificBooks during its personal activities
        //so life indicators must be updated
        Fatigue = -5
        Happiness = 10
        Hungry = -5
        Knowledge = 25
    }
}


class FireMan: AbstractPersonage {
    override func getPaid() {
        Money = 2500/30
    }
    override func sleep() {
//FireMan doesn't sleep a lot
        Fatigue = 80
        Happiness = 5
        Hungry = -5
        Knowledge = 0
    }
    override func doPersonalActivities() {
        //FireMan makes lot of sports during personal activities
        //so life indicators must be updated
        Fatigue = -10
        Happiness = 5
        Hungry = -5
        Knowledge = 15
    }
    override func work() {
        Fatigue = -25
        Happiness = -55
        Hungry = -45
        Knowledge = 10
    }
}
let student = Student(name: "Simon")
let searcher = Searcher(name: "Natasha")
let fireMan = FireMan(name:"Edward")
for i in 1...30{
    student.playDay()
    searcher.playDay()
    fireMan.playDay()
}
