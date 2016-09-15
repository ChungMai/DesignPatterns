//: Playground - noun: a place where people can play

import UIKit

protocol ICommand{
    func execute()
}

class Light{
    
    func on(){
        print("Light is On")
    }
    
    func off(){
        print("Light is Off")
    }
}

class AudioPlayer{
    enum AudioPlayerState{
        case On
        case Off
        case Playing
    }
    
    private var state = AudioPlayerState.Off
    
    func on(){
        state = AudioPlayerState.On
        print("Audio Player is On")
    }
    
    func off(){
        state = AudioPlayerState.Off
        print("Audio Player is Off")
    }
    
    func playCD(){
        if state == AudioPlayerState.Off{
            print("Doesn't work: the audio player is currently off")
        }
        else{
            state = AudioPlayerState.Playing
            print("AudioPlayer is playing")
        }
    }
    
    func stopCD(){
        if state == AudioPlayerState.Off{
            print("Doesn't work: the audio player is currently off")
        }
        
        if state == AudioPlayerState.On {
            print("Doesn't work : the audio player currently doesn't play music")
        }
        else {
            state = AudioPlayerState.On
            print("AudioPlayer has stopped to play music")
        }
    }
}

class LightOnCommand: ICommand{
    
    var light : Light
    init(light : Light){
        self.light = light
    }
    
    func execute() {
        self.light.on()
    }
}

class LightOffCommand : ICommand{
    var light : Light
    init(light : Light){
        self.light = light
    }
    
    func execute() {
        self.light.off()
    }
}

class AudioPlayerOnCommand: ICommand {
    var audioPlayer:AudioPlayer
    init(audioPlayer:AudioPlayer) {
        self.audioPlayer = audioPlayer
    }
    func execute() {
        audioPlayer.on()
    }
}

class AudioPlayerOffCommand: ICommand {
    var audioPlayer:AudioPlayer
    init(audioPlayer:AudioPlayer) {
        self.audioPlayer = audioPlayer
    }
    func execute() {
        audioPlayer.off()
    }
}

class AudioPlayerPlayCDCommand: ICommand {
    var audioPlayer:AudioPlayer
    init(audioPlayer:AudioPlayer) {
        self.audioPlayer = audioPlayer
    }
    func execute() {
        audioPlayer.playCD()
    }
}

class AudioPlayerStopCDCommand: ICommand {
    var audioPlayer:AudioPlayer
    init(audioPlayer:AudioPlayer) {
        self.audioPlayer = audioPlayer
    }
    func execute() {
        audioPlayer.stopCD()
    }
}

class AudioPlayerSetOnAndPlayCommand : ICommand{
    var audioPlayer : AudioPlayer
    
    init(audioPlayer:AudioPlayer){
        self.audioPlayer = audioPlayer
    }
    
    func execute() {
        self.audioPlayer.on()
        self.audioPlayer.playCD()
    }
}

class AudioPlayerSetOffAndStopCommand : ICommand{
    var audioPlayer : AudioPlayer
    
    init(audioPlayer:AudioPlayer){
        self.audioPlayer = audioPlayer
    }
    
    func execute() {
        self.audioPlayer.off()
        self.audioPlayer.stopCD()
    }
}

class UniversalRemoteControl{
    var onCommands = [ICommand]()
    var offCommands = [ICommand]()
    
    init(){
        for _ in 1...4{
            onCommands.append(NoCommand())
            offCommands.append(NoCommand())
        }
    }
    
    func addCommandToSlot(slot : Int, onCommand : ICommand, offCommand : ICommand){
        onCommands[slot] = onCommand
        offCommands[slot] = offCommand
    }
    
    func buttonOnIsPushedOnSlot(slot :Int){
        onCommands[slot].execute()
    }
    
    func buttonOffIsPushedOnSlot(slot:Int) {
        offCommands[slot].execute()
    }
}
class NoCommand : ICommand{
    func execute() {
        print("No command associated to this")
    }
}

let uRemoteControl = UniversalRemoteControl()
let audioPlayerLivingRoom = AudioPlayer()
let lightBedroom = Light()
let lightHall = Light()

let bedroomLightOnCommand = LightOnCommand(light : lightBedroom)
let bedroomLightOffCommand = LightOffCommand(light : lightBedroom)

let hallLightOnCommand = LightOnCommand(light : lightHall)
let hallLightOffCommand = LightOffCommand(light : lightHall)

let audioPlayerLivingRoomOnCommand = AudioPlayerOnCommand(audioPlayer: audioPlayerLivingRoom)
let audioPlayerLivingRoomOffCommand = AudioPlayerOffCommand(audioPlayer: audioPlayerLivingRoom)
let audioPlayerOnAndPlayLivingRoom = AudioPlayerSetOnAndPlayCommand(audioPlayer: audioPlayerLivingRoom)
let audioPlayerStopAndOffLivingRoom = AudioPlayerSetOffAndStopCommand(audioPlayer:audioPlayerLivingRoom)

uRemoteControl.addCommandToSlot(slot: 0, onCommand: bedroomLightOnCommand, offCommand: bedroomLightOffCommand)
uRemoteControl.addCommandToSlot(slot: 1, onCommand: hallLightOnCommand, offCommand: hallLightOffCommand)
uRemoteControl.addCommandToSlot(slot: 2, onCommand: audioPlayerLivingRoomOnCommand, offCommand: audioPlayerLivingRoomOffCommand)
uRemoteControl.addCommandToSlot(slot: 3, onCommand:audioPlayerOnAndPlayLivingRoom, offCommand: audioPlayerStopAndOffLivingRoom)


uRemoteControl.buttonOnIsPushedOnSlot(slot: 0)


