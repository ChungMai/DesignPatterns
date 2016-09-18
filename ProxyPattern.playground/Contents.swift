//: Playground - noun: a place where people can play

import UIKit

protocol IAnimation{
    func display() -> String
    func click() -> String
}

class Video:IAnimation{
    func click() -> String {
        return ""
    }
    
    func display() -> String {
        return "Display the video"
    }
    
    func load() -> String{
        return "Loading the video"
    }
    
    func play() -> String{
        return "Playing the video"
    }
}


class ScreenShot:IAnimation{
    var video:Video?
    
    func click() -> String {
        if let video = video{
            return video.play()
        }
        else{
            video = Video()
            return video!.load()
        }
    }
    
    func display() -> String {
        if let video = video{
            return video.display()
        }
        else{
            return "Display the screenshot of the video"
        }
    }
}


let animation = ScreenShot()
var msgDisplay = animation.display()
print(msgDisplay)

msgDisplay = animation.click()
print(msgDisplay)

msgDisplay = animation.display()
print(msgDisplay)
