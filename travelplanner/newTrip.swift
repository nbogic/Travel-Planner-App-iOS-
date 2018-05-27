//
//  newTrip.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

//this is the new trip class, essential in the trip planning set up
//holds all relevant values, features multiple functions
class newTrip   {
    var destination:String?
    var budget:Int = 0
    var arrivalDate:String?
    var returnDate:String?
    var description:String?
    var placementPlan:Int = 0
    var submission:Bool?
    
    
    var countryTitle:String = ""
    var countryDescription:String = ""
    var imageCount:String = ""
    
    func clearData() {
        destination = ""
        budget = 0
        arrivalDate = ""
        returnDate = ""
        description = ""
    }
    
    init(_ a:String, _ b:Int, _ c:String, _ d:String, _ e:String, f:Int) {
        destination = a
        budget = b
        arrivalDate = c
        returnDate = d
        description = e
        placementPlan = f
        
        //this tests to see if the country is available based on the countries i currently have referenced within the app
        //changes image and returns description from the newdestination class
        if description == "Australia" {
            countryDescription = (travelVariables.Australia?.destinationDescription)!
            imageCount = "1"
            travelVariables.global_active = 1
        } else if description == "Vietnam" {
            countryDescription = (travelVariables.Vietnam?.destinationDescription)!
            imageCount = "7"
                        travelVariables.global_active = 2
        } else if description == "Dubai" {
                countryDescription = (travelVariables.Dubai?.destinationDescription)!
            imageCount = "4"
                        travelVariables.global_active = 3
        } else if description == "Germany" {
                countryDescription = (travelVariables.Germany?.destinationDescription)!
            imageCount = "5"
                        travelVariables.global_active = 4
            
        } else if description == "Russia" {
                countryDescription = (travelVariables.Russia?.destinationDescription)!
            imageCount = "6"
                        travelVariables.global_active = 5
        } else if description == "China" {
                    countryDescription = (travelVariables.China?.destinationDescription)!
            imageCount = "3"
                        travelVariables.global_active = 6
        } else if description == "Brazil" {
                    countryDescription = (travelVariables.Brazil?.destinationDescription)!
            imageCount = "2"
                        travelVariables.global_active = 7
        }
    }
    
    init() {
    
    }
    
    func editData() {
        if travelVariables.current_active == placementPlan {
            if submission == true {
            clearData()
            }
        }
    }
    
    func confirmData() -> Bool {
        if destination != "" && arrivalDate != "" && returnDate != "" && description != ""  {
            return true
        } else {return false}
        
    }

}
