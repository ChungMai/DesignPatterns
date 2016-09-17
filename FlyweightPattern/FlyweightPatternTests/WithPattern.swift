//
//  WithPattern.swift
//  FlyweightPattern
//
//  Created by Home on 9/17/16.
//  Copyright © 2016 Home. All rights reserved.
//

import Foundation

class WithPattern:AbstractPerfTest{
    //Execute the test
    override func run(){
        var j:Int = 0
        for _ in 1...NUMBER_TO_GENERATE{
            let idx = Int(arc4random_uniform(UInt32(self.colors.count-1)))
            let rect = FlyweightRectFactory.getFlyweightRectWithNS(self.colors[idx])
            rect.display(generateXPos(), yPos: generateYPos(), width: generateRectWidth(), height: generateRectHeight())
            j += 1
        }
        print("\(j) rects generated")
    }
}