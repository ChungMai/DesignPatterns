//: Playground - noun: a place where people can play

import UIKit

public class Vertex{
    
    var key:String?
    var neighbors : Array<Edge>
    init(){
        self.neighbors = Array<Edge>()
    }
}

public class Edge{
    
    var neighbor:Vertex
    var weight : Int
    init(){
        weight = 0
        self.neighbor = Vertex()
    }
}


public class SwiftGraph{
    
    private var canvas : Array<Vertex>
    public var isDirected:Bool
    
    init(){
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    func addVertex(key : String) -> Vertex{
        let childVertex : Vertex = Vertex()
        childVertex.key = key
        
        canvas.append(childVertex)
        return childVertex
    }
    
    func addEdge(source:Vertex, neighbor:Vertex, weight:Int){
        let newEdge = Edge()
        
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        if(!isDirected){
            let reverseEdge = Edge()
            //establish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }
}

class Path {
    var total: Int!
    var destination: Vertex
    var previous: Path!
    init() {
        destination = Vertex()
    }
}