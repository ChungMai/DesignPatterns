//
//  AbstractPerfTest.swift
//  FlyweightPattern
//
//  Created by Home on 9/17/16.
//  Copyright © 2016 Home. All rights reserved.
//

import Foundation
import SpriteKit
import Cocoa

class AbstractPerfTest {
    let colors:[SKColor] = [
        SKColor.yellowColor(),
        SKColor.blackColor(),
        SKColor.cyanColor(),
        SKColor.whiteColor(),
        SKColor.blueColor(),
        SKColor.brownColor(),
        SKColor.redColor(),
        SKColor.greenColor(),
        SKColor.grayColor(),
        SKColor.purpleColor()
    ]
    let sks = SKScene()
    let view = SKView(frame: NSRect(x: 0, y: 0, width: 1024, height:768))
    
    let maxRectWidth = 100
    let maxRectHeight = 100
    
    //must be override
    func run(){
        preconditionFailure("Must be overriden")
    }
    
    //Mark generate rect height and width
    func generateRectWidth()-> Int{
        return Int(arc4random_uniform(UInt32(maxRectWidth)))
    }
    
    func generateRectHeight() -> Int{
        return Int(arc4random_uniform(UInt32(maxRectHeight)))
    }
    
    func generateXPos() -> Int{
        return Int(arc4random_uniform(UInt32(view.bounds.size.width)))
    }
    
    func generateYPos() -> Int{
        return
            Int(arc4random_uniform(UInt32(view.bounds.size.height)))
    }
}