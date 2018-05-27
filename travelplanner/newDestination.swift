//
//  newDestination.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

//class that holds all destination values
class newDestination {
    var destinationName:String? //name of the destination
    var destinationReview:[String] = []
    var destinationBackgroundImg = ""  //official background image
    var destinationVideoImg = "path"
    var destinationDescription:String?
    var destinationReviewName:[String] = []
    var destinationImages:[String] = [] //all minor images
    var destinationCategory:[String] = []
    
    
    
    init(_ a:String,_ b:String,_ c:String,_ d:[String]) { //contructor
        destinationName = a
        destinationDescription = b
        destinationBackgroundImg = c
        destinationCategory = d
    }
    
}
