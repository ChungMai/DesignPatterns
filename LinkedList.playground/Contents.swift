//: Playground - noun: a place where people can play

import UIKit

class LLNode<T>{
    
    var key : T!
    var next : LLNode?
    var previous : LLNode?
    
}


class LinkedList<T:Equatable>{
    var head : LLNode<T> = LLNode<T>()
    
    func addLink(key:T){
        if(head.key == nil){
            head.key = key
            return
        }
        
        var current : LLNode? = head
        
        while current != nil{
            if current?.next == nil{
                let childToUse : LLNode = LLNode<T>()
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
            else{
                current = current?.next
            }
        }
    }
    
    func printAllKey(){
        var current:LLNode! = head
        
        while current != nil{
            print("Link item is:\(current?.key!)")
            current = current.next
        }
    }
}

let ll = LinkedList<String>()
ll.addLink(key: "Mai")
ll.addLink(key: "Huu")
ll.addLink(key: "Chung")

ll.printAllKey()

