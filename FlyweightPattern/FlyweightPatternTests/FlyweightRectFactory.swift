//
//  FlyweightRectFactory.swift
//  FlyweightPattern
//
//  Created by Home on 9/17/16.
//  Copyright © 2016 Home. All rights reserved.
//

import Foundation
import SpriteKit


class FlyweightRectFactory{
    internal static var rectsMap = Dictionary<SKColor,FlyweightRect>()
    internal static var rectsMapNS = NSMutableDictionary()
    internal static var rectsMapNSC = NSCache()
    
    static func getFlyweightRect(color:SKColor) -> FlyweightRect{
        if let result = rectsMap[color]{
            return result
        }
        else{
            let result = FlyweightRect(color:color)
            rectsMap[color] = result
            return result
        }
    }
    
    static func getFlyweightRectWithNS(color:SKColor) -> FlyweightRect{
        let result = rectsMapNS[color.description]
        if result == nil{
            let flyweight = FlyweightRect(color:color)
            rectsMapNS.setValue(flyweight, forKeyPath: color.description)
            return flyweight as FlyweightRect
        }else {
            return result as! FlyweightRect
        }
    }
    
    static func getFlyweightRectWithNSc(color: SKColor) -> FlyweightRect{
        let result = rectsMapNSC.objectForKey(color.description)
        if result == nil {
            let flyweight = FlyweightRect(color: color)
            rectsMapNSC.setObject(flyweight, forKey:color.description)
            return flyweight as FlyweightRect
        }else {
            return result as! FlyweightRect
        }
    }
}
