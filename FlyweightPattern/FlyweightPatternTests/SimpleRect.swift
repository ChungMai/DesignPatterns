//
//  SimpleRect.swift
//  FlyweightPattern
//
//  Created by Home on 9/17/16.
//  Copyright © 2016 Home. All rights reserved.
//

import Foundation
import SpriteKit


class SimpleRect{
    var color:SKColor!
    var xPos: Int?
    var yPos: Int?
    var width: Int?
    var height: Int?
    var image: NSImage?
    var sprite:SKSpriteNode?
    
    //the constructor contains our intrinsic state
    init(color:SKColor){
        self.color = color
        self.image = NSImage()
        self.sprite = SKSpriteNode()
    }
    
    func display(xPos:Int, yPos:Int, width:Int, height:Int){
        self.xPos = xPos
        self.yPos = yPos
        self.width = width
        self.height = height
    }
    
    func description()-> String  {
        return "rect position: \(self.xPos), \(self.yPos) : dimension: \(self.width), \(self.height)  : color: \(self.color)"
    }
}