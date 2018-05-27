//
//  travelVariables.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

struct travelVariables {
    //add travel plans (view controllers: travelPlanView, travelPlanAddView
    //class: newTrip
    
    //travelPlanView
    //all variables that need to set on a static accessor level in order to ensure data remains saved in between view controlllers
    static var current_active:Int = 1
    static var active:Bool = false

    static var plan1active = newTrip()
    static var plan2active = newTrip()
    static var plan3active = newTrip()
    static var plan4active = newTrip()
    static var plan5active = newTrip()
    
    static var editMode:Bool = false
    
    static var planCollection = [plan1active, plan2active, plan3active, plan4active, plan5active]
    
    static var Australia:newDestination?
    static var Vietnam:newDestination?
    static var Dubai:newDestination?
    static var Germany:newDestination?
    static var Russia:newDestination?
    static var China:newDestination?
    static var Brazil:newDestination?
    
    static var global_active:Int = 0
    static var questionnaire_done:Bool = false
    static var questionnaire_results:[String] = []
    
    static var destinationCollection = [Australia, Vietnam, Dubai, Germany, Russia, China, Brazil]
    
    static var images: [String] = []
    static var loaded_before: Bool = false
    static var currentPageTitle: [String] = []
    static var tempGlobalActive = [0, 0, 0, 0]
    static var loaded_again: Bool = false
    
    
    static var count_c = 0

}
