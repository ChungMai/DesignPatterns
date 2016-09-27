//: Playground - noun: a place where people can play

import UIKit

class HashNode{
    
    var firstname:String!
    var lastname:String!
    var next:HashNode!
}

class HashTable{
    private var buckets:Array<HashNode>
    
    init(capacity:Int){
        self.buckets = Array<HashNode!>()
    }
    
    func createHash(fullname:String) -> Int!{
        var remainder : Int = 0
        var divisor : Int = 0
        
        for key in fullname.unicodeScalars{
            divisor += Int(key.value)
        }
        
        remainder = divisor % buckets.count
        
        return remainder-1
    }
    
    func addWord(firstname:String, lastname:String){
        var hashindex:Int!
        var fullname:String!
        
        fullname = firstname + lastname
        hashindex = self.createHash(fullname: fullname)
        
        let childToUse : HashNode = HashNode()
        var head:HashNode!
        
        childToUse.firstname = firstname
        childToUse.lastname = lastname
        
        if buckets[hashindex] == nil{
            buckets[hashindex] = childToUse
        }
        else{
            head = buckets[hashindex]
            
            childToUse.next = head
            head = childToUse
            buckets[hashindex] = head
        }
    }
}

