//: Playground - noun: a place where people can play

import UIKit

protocol UserProtocol {
    func update(object: AnyObject)
}

class User: UserProtocol,Equatable{
    let name : String!
    
    init(name:String){
        self.name = name
    }
    
    func update(object: AnyObject) {
        let info = object as! Info
        print("\(self.name) notified that \(info.message) have status \(info.status) on \(info.date.description)")
    }
    
   
}

func ==(lhs: User, rhs: User) -> Bool{
    return lhs.name == rhs.name
}

class Info{
    var date = NSDate()
    var message : String!
    var status : InfoStatus!
    
    init(msg : String!, status : InfoStatus){
        self.message = msg
        self.status = status
    }
}

enum InfoStatus{
    case Join
    case Leave
}

protocol RoomProtocol {
    func addObserver(user : User)
    func removeObserver(user : User)
    func notifyObserver(object : AnyObject)
}

class Room : RoomProtocol{
    
    private var users = [User]()
    
    func addObserver(user: User) {
        users.append(user)
        let info = Info(msg: "\(user.name)", status: .Join)
        notifyObserver(info)
    }
    
    func removeObserver(user: User) {

        if users.contains(user){
            let info = Info(msg: "\(user.name)", status: .Leave)
            notifyObserver(info)
            users.removeObject(user)
        }
        else{
            print("\(user.name) is not join the room")
        }
        
    }
    
    func notifyObserver(object: AnyObject) {
        for u in users{
            u.update(object)
        }
    }
    
}

extension Array where Element: Equatable {
    
    mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }

}

let room = Room()
let user1 = User(name:"Julien")
let user2 = User(name:"Alain")
let user3 = User(name:"Helmi")
let user4 = User(name:"Raphael")

room.addObserver(user1)
room.removeObserver(user1)
room.removeObserver(user1)
room.removeObserver(user2)


