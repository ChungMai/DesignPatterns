//: Playground - noun: a place where people can play

import Foundation
import UIKit

public class TrieNode{
    
    var key : String!
    var children : Array<TrieNode>
    var isFinal : Bool
    var level : Int
    
    init(){
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
    
}

public class Trie{
    private var root:TrieNode!
    
    init(){
        root = TrieNode()
    }
    
    func addWord(keyword : String){
        
        guard keyword.characters.count > 0 else {
            return
        }
        
        var current : TrieNode = root
        
        while keyword.characters.count != current.level{
            var childToUse : TrieNode!
            let index = keyword.index(keyword.startIndex, offsetBy: current.level + 1)
            let searchKey : String = keyword.substring(to: index)

            for child in current.children{
                if child.key == searchKey{
                    childToUse = child
                    break
                }
            }
            
            if childToUse == nil{
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
        }
        
        if keyword.characters.count == current.level{
            current.isFinal = true
            return
        }
    }
    
    func findWord (keyWord : String) -> Array<String>!{
        guard keyWord.characters.count > 0 else {
            return nil
        }
    
        var current : TrieNode = root
        var wordList : Array<String> = Array<String>()
        
        //printChildRoot(root: root, keyWord:keyWord)
    
        while keyWord.characters.count != current.level{
            var childToUse : TrieNode!
            let index = keyWord.index(keyWord.startIndex, offsetBy: current.level + 1)
            let searchKey : String = keyWord.substring(to: index)
    
            for child in current.children{
                if child.key == searchKey{
                    childToUse = child
                    current = childToUse
                    break
                }
            }
    
            if childToUse == nil{
                return nil
            }
        }
    
        if current.key == keyWord && current.isFinal{
            wordList.append(current.key)
        }
    
        for child in current.children{
            print(child.key)
            if child.isFinal == true{
                wordList.append(child.key)
            }
        }
        
        return wordList
    }
    
    func printChildRoot(root: TrieNode, keyWord: String){
        for child in root.children{
            if child.key.characters.count >= keyWord.characters.count && child.isFinal{
                print(child.key)
            }
            printChildRoot(root: child, keyWord: keyWord)
        }
    }
    
    func printChildRoot(keyWord: String){
        for child in root.children{
            if child.key.characters.count >= keyWord.characters.count && child.isFinal{
                print(child.key)
            }
            printChildRoot(root: child, keyWord: keyWord)
        }
    }
    
    func findNode(keyWord:String) -> TrieNode?{
        print("Find Node")
        for child in root.children{
            
            print(child.key)
//            if(child.key == keyWord){
//                print(child.key)
//                return child
//            }
            
            findNode(keyWord: keyWord)
            
        }
        
        return nil
    }
    
}


let trie = Trie()
trie.addWord(keyword: "Ball")
trie.addWord(keyword: "Balls")
trie.addWord(keyword: "Ballard")
trie.addWord(keyword: "Bat")
trie.addWord(keyword: "Bar")
trie.addWord(keyword: "Bad")


//let wordList: Array<String>! = trie.findWord(keyWord: "Ba")

//trie.printChildRoot(keyWord: "Bal")
let trieNode = trie.findNode(keyWord: "Ba")
print(trieNode?.key)



