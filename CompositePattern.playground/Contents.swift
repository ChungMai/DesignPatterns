//: Playground - noun: a place where people can play

import UIKit

class VODComponent : Equatable{
    func add(vodComponent:VODComponent){
        assert(false, "This method is not supported")
    }
    
    func remove(vodComponent : VODComponent){
        assert(false, "This method is not suopported")
    }
    
    func getName() -> String{
        assert(false, "This method is not suopported")
    }
    
    func getDescription() -> String{
        assert(false, "This method is not suopported")
    }
    
    func getPrice() -> Double{
        assert(false, "This method is not suopported")
    }
    
    func getChild(i:Int) -> VODComponent{
        assert(false, "This method is not suopported")
    }
    
    func display(){
        assert(false, "This method is not supported")
    }
}

class VODItem : VODComponent{
    private var name : String!
    private var description : String!
    private var price : Double!
    
    init(name:String!, description:String!, price:Double!) {
        self.name = name
        self.description = description
        self.price = price
    }
    
    override func getName() -> String {
        return self.name!
    }
    
    override func getDescription() -> String {
        return self.description!
    }
    
    override func getPrice() -> Double {
        return self.price!
    }
    
    override func display() {
        print(" \(name!), \(price!), ---- \(description!)")
    }
}

class VODCategory:VODComponent{
    var vodComponents = [VODComponent]()
    private var name:String!
    private var description:String!
    
    init(name:String!,description:String!){
        self.name = name
        self.description = description
    }
    
    override func add(vodComponent: VODComponent) {
        vodComponents.append(vodComponent)
    }
    
    override func remove(vodComponent: VODComponent) {
        vodComponents.removeObject(vodComponent)
    }
    
    override func display() {
        for e in vodComponents{
            e.display()
        }
    }
}

class VODManager{
    var catalog : VODComponent
    
    init(vod:VODComponent){
        catalog = vod
    }
    
    func displayCatalog(){
        catalog.display()
    }
}

func ==(lhs:VODComponent, rhs:VODComponent) -> Bool{
    return lhs === rhs
}


extension Array where Element : Equatable{
//   mutating func removeObject(object : Element){
//    if let index = indexOf(object){
//        removeAtIndex(index)
//    }
//   }
    mutating func removeObject<T:Equatable> (object:T){
        for i in (self.count-1).stride(through: 0, by: -1){
            if let element = self[i] as? T{
                if element == object{
                    self.removeAtIndex(i)
                }
            }
        }
    }
}


//Usage
let horrorCategory = VODCategory(name:"Horror", description: "Horror movies category")
let tvSeriesCategory = VODCategory(name: "TV Series", description:"TV Series category")
let comedyCategory = VODCategory(name: "Comedy", description:"Comedy category")
let voSTTvSeries = VODCategory(name: "VOSTSeries", description:"VOST TV Series sub category")

let allVODComponents = VODCategory(name: "All VOD", description: "All vod component")
let vodManager = VODManager(vod:allVODComponents)

allVODComponents.add(horrorCategory)
allVODComponents.add(tvSeriesCategory)
allVODComponents.add(comedyCategory)

tvSeriesCategory.add(voSTTvSeries)

//horrorCategory.add(VODItem(name: "Scream", description: "Screammovie", price: 9.99))
//horrorCategory.add(VODItem(name: "Paranormal Activity",description: "Paranormal Activity movie", price: 9.99))
//horrorCategory.add(VODItem(name: "Blair Witch Project",description: "Blair Witch movie", price: 9.99))
tvSeriesCategory.add(VODItem(name: "Game of thrones S1E1",description: "Game of thrones Saison 1 episode 1", price: 1.99))
tvSeriesCategory.add(VODItem(name: "Deadwood", description:"Deadwood Saison 1 episode 1", price: 1.99))
tvSeriesCategory.add(VODItem(name: "Breaking Bad", description:"Breaking Bad Saison 1 Episode 1 " , price: 1.99))
voSTTvSeries.add(VODItem(name: "Doc Martin", description: "DocMartin French serie Saison 1 Episode 1", price: 1.99))
voSTTvSeries.add(VODItem(name: "Camping Paradis", description:"Camping Paradis French serie Saison 1 Episode 1", price: 1.99))
//comedyCategory.add(VODItem(name: "Very Bad Trip", description:"Very Bad Trip Movie", price: 9.99))
//comedyCategory.add(VODItem(name: "Hot Chick", description: "HotChick Movie", price: 9.99))
//comedyCategory.add(VODItem(name: "Step Brothers", description:"Step Brothers Movie", price: 9.99))
//comedyCategory.add(VODItem(name: "Bad teacher", description: "Bad Teacher Movie", price: 9.99))

vodManager.displayCatalog()
