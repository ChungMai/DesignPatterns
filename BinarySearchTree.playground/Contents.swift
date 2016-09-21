//: Playground - noun: a place where people can play

import UIKit

public class AVLTree<T:Comparable>{
    var key:T?
    var left:AVLTree?
    var right:AVLTree?
    var height:Int = 0
    
    func addNode(key:T){
        if self.key == nil{
            self.key = key
            self.height = 0
            return
        }
        
        if(key <= self.key!){
            if self.left != nil{
                left?.addNode(key: key)
            }
            else{
                let leftChild : AVLTree = AVLTree()
                leftChild.key = key
                leftChild.height = 0
                self.left = leftChild
                print("left node:",self.left?.key)
            }
            self.setNodeHeight()
        }
        
        if key > self.key!{
            if self.right != nil{
                right?.addNode(key: key)
            }
            else{
                let rightChild : AVLTree = AVLTree()
                rightChild.key = key
                rightChild.height = 0
                self.right = rightChild
                print("right node:", self.right?.key)
            }
            
            self.setNodeHeight()
        }
    }
    
    func getNodeHeigh(aNode : AVLTree!) -> Int{
        if aNode == nil{
            return -1
        }
        else{
            return aNode.height
        }
    }
    
    func setNodeHeight() -> Bool{
        if self.key == nil{
            print("Key not existing")
            return false
        }
        
        var nodeHeigh : Int = 0
        
        nodeHeigh = max(getNodeHeigh(aNode: self.left), getNodeHeigh(aNode: self.right)) + 1
        self.height = nodeHeigh
        return true
    }
    
    func isTreeBalanced() -> Bool{
        if self.key == nil{
            return false
        }
        
        if(abs(getNodeHeigh(aNode: self.left) - getNodeHeigh(aNode: self.right)) <= 1){
            return true
        }
        
        return false
    }
    
}


let numberList : Array<Int> =  [8, 2, 10, 9, 11, 1, 7]
var root = AVLTree<Int>()

for number in numberList{
    root.addNode(key: number)
}

print(root.right?.left?.key)

