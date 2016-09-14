//: Playground - noun: a place where people can play

import UIKit

protocol UserProtocol {
    func sendMessage(mediator : MediatorProtocol, message : AnyObject)
    func receiveMessage (message : AnyObject)
}

protocol MediatorProtocol {
    var users : [UserProtocol]? {get}
    
    func broadcastMessage(sender : UserProtocol, message:AnyObject)
    func register(users:UserProtocol)
}

class User : UserProtocol{
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    func sendMessage(mediator: MediatorProtocol, message: AnyObject) {
        mediator.broadcastMessage(self, message: message as AnyObject)
    }
    
    func receiveMessage(message: AnyObject) {
        print("\(self.name) received \(String(message))")
    }
}

class Mediator : MediatorProtocol{
    
    private let queue =  dispatch_queue_create("MediatorPattern", DISPATCH_QUEUE_CONCURRENT)
    
    var users:[UserProtocol]? = [User]()
    
    func broadcastMessage(sender: UserProtocol, message: AnyObject) {
        dispatch_barrier_sync(self.queue, {
            () in
            guard let users = self.users else{
                return
            }
            
            for u in users{
                if u as! User !== sender as! User{
                    u.receiveMessage(message)
                }
            }
        })
    }
    
    func register(user : UserProtocol) {
        dispatch_barrier_sync(self.queue, {
            () in
            self.users?.append(user)
        })
    }
}

var user1 = User(name:"Julien")
var user2 = User(name:"Helmi")
var user3 = User(name:"Adrien")
var user4 = User(name:"Raphael")

var mediator1 = Mediator()
mediator1.register(user1)
mediator1.register(user2)
mediator1.register(user3)

user1.sendMessage(mediator1, message: "This is message from \(user1.name)")


var mediator2 = Mediator()
mediator2.register(user2)
mediator2.register(user4)
user2.sendMessage(mediator2, message: "This is message from \(user2.name)")
