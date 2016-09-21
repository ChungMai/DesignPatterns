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
                //print("left node:",self.left?.key)
            }
            self.setNodeHeight()
            isValidAVLTree()
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
                //print("right node:", self.right?.key)
            }
            
            self.setNodeHeight()
            isValidAVLTree()
        }
        
        
    }
    
    func addNodeMode(key:T){
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
                //print("left node:",self.left?.key)
            }
            self.setNodeHeight()
            isValidAVLTree()
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
                //print("right node:", self.right?.key)
            }
            
            self.setNodeHeight()
            isValidAVLTree()
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
    
    func isValidAVLTree()->Bool?{
    
        //check for valid scenario
        if (self.key == nil) {
            print("no key provided..")
            return false
        }
        
        
        if (self.isTreeBalanced() == true) {
            //print("node \(self.key!) already balanced..")
            return true
        }
        
        let childToUse : AVLTree = AVLTree()
        childToUse.height = 0
        childToUse.key = self.key
        print("Change root:", self.key)
        
        if(getNodeHeigh(aNode: self.left) - getNodeHeigh(aNode: self.right) > 1){
            self.key = self.left?.key
            let misKey = self.left?.right?.key
            
            self.height = getNodeHeigh(aNode: self.left)
        
            childToUse.right =  self.right
            self.right = childToUse
            
            
            self.left = self.left?.left
            self.left?.height = 0
            
            if misKey != nil{
                addNode(key: misKey!)
            }
            
            
//            print("Node ", self.key)
//            print("Left Node ", self.left?.key)
//            print("Right Node ", self.right?.key)
            return true
        }
        
        if(getNodeHeigh(aNode: self.right) - getNodeHeigh(aNode: self.left) > 1){
            self.key = self.right?.key
            let misKey = self.right?.left?.key
            self.height = getNodeHeigh(aNode: self.right)
            
            childToUse.left = self.left
            self.left = childToUse
            
            self.right = self.right?.right
            self.right?.height = 0
            
            if misKey != nil{
                addNode(key: misKey!)
            }
//            print("Node ", self.key)
//            print("Left Node ", self.left?.key)
//            print("Right Node ", self.right?.key)
            return true
        }
        
        return nil
    }
    
    func printNodes(aNode : AVLTree){
        if aNode.key == nil{
            return
        }
        
        print(aNode.key)
        
        if(aNode.left != nil){
            printNodes(aNode: aNode.left!)
        }
        
        if(aNode.right != nil){
            printNodes(aNode: aNode.right!)
        }
    }
    
}

// 19, 17, 18,14,12
let numberList : Array<Int> =  [29,26,23, 19,17, 18, 14, 12, 6, 4,2,1]
var root = AVLTree<Int>()

for number in numberList{
    root.addNode(key: number)
}

root.isValidAVLTree()

print("Root:",root.key)

print("Root Left:",root.left?.right?.right?.key)

print("Right Node")
root.printNodes(aNode: root.right!)

print("Left Node")
root.printNodes(aNode: root.left!)

