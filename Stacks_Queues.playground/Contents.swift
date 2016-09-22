//: Playground - noun: a place where people can play

import UIKit

class QNode<T>{
    
    var key:T?
    var next:QNode?
}

class Queue<T>{
    var top:QNode<T>?
    
    func enQueue(key: T){
        if(top == nil){
            top = QNode<T>()
        }
        
        if(top?.key == nil){
            top?.key = key
            return
        }
        
        let childToUser : QNode<T> = QNode<T>()
        var current : QNode = top!
        
        while current.next != nil{
            current = current.next!
        }
        
        childToUser.key = key
        current.next = childToUser
    }
    
    func deQueue() -> T?{
        let topItem : T? = top?.key
        
        if(topItem == nil){
            return nil
        }
        
        if let nextItem = top?.next{
            top = nextItem
        }
        else{
            top = nil
        }
        
        return topItem
    }
}

let q = Queue<String>()
q.enQueue(key: "Mai")
q.enQueue(key: "Huu")
q.enQueue(key: "Chung")

let item = q.deQueue()
print(item)
print(q.top?.key)

