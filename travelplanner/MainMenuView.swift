//
//  MainMenuView.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

class MainMenuView: UIViewController {

    @IBOutlet weak var label1: UILabel!
    var trivia_results:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loads all the destinations
        createDestinations()
        //to avoid repetition and compiling error, can only be assigned once in duration of the program run time
        if travelVariables.loaded_again == false {
        travelVariables.questionnaire_results = trivia_results
            travelVariables.loaded_again = true
            
        }
        //test lines
       /* var hi:String = trivia_results[0] + trivia_results[1] + trivia_results[2] + trivia_results[3]
        label1.text = hi*/
        
        /*for _ in trivia_results {
            var x:Int = 0
            print(trivia_results[x])
            x += 1
        } */
       /* if travelVariables.questionnaire_done == true {
        print(trivia_results[0])
        print(trivia_results[1])
        print(trivia_results[2])
        print(trivia_results[3])
        } */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //creates a seriesof objects and assigns the relvant information into the constructor
    func createDestinations() {
        travelVariables.Australia = newDestination("Australia", "A land that bolsters great weather and beaches, and a lively urban culture that radiates throughout its cities.", "1", ["Energetic", "Medium", "Sunny", "Very"])
        travelVariables.Vietnam = newDestination("Vietnam", "Fmaous for its dazzling rivers, golden beaches, Buddhist pagodas and bustling cities", "7", ["Fast paced", "Low", "Regional", "Very"])
        travelVariables.Dubai = newDestination("Dubai", "Dubai is a city in the United Arab Emirates known for its large selection in shopping, top of the line architecture and a renowned for its lively and spectacular nightlife.", "4", ["Discoverer", "High", "Urban", "Very"])
        travelVariables.Germany = newDestination("Germany", "Germany is a Western European country with a landscape of forests, rivers, mountain ranges and North Sea beaches. It has over 2 millennia of history.", "5", ["Individualistic", "High", "Regional", "Average"])
        travelVariables.Russia = newDestination("Russia", "Russia, the world’s largest country, located surrounding European and Asian countries. Its landscape ranges from tundra and forests to subtropical beaches. ", "6", ["Discoverer", "Medium", "Cold", "Average"])
        travelVariables.China = newDestination("China", "China is a country with a very large population. In East Asia whose vast landscape encompasses grassland, desert, mountains, lakes, rivers and more than 14,000km of coastline. ", "3", ["Individualistic", "Low", "Urban", "Average"])
        travelVariables.Brazil = newDestination("Brazil", "Brazil is a distant South American country, which features landmarks such as the Amazon Basin found in the northern regions to vineyards and massive Iguaçu Falls in the southern region.", "2", ["Energetic", "Medium", "Regional", "Average"])
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


