//
//  travelPlanAddView.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

class travelPlanAddView: UIViewController {

    @IBOutlet weak var destinationBox: UITextField!
    @IBOutlet weak var arrivalDateBox: UITextField!
    @IBOutlet weak var departureDateBox: UITextField!
    @IBOutlet weak var costBox: UITextField!
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var _addPlan: UIButton!
    
    //declaration of 5 new trip objects
    var plan1:newTrip!
    var plan2:newTrip!
    var plan3:newTrip!
    var plan4:newTrip!
    var plan5:newTrip!
    
    //calls the create plan function, later referred back to in the main planner view, segues back to the previous view
    @IBAction func addPlan(_ sender: UIButton) {
        if travelVariables.editMode != true {
        

        }
                createPlan(travelVariables.current_active)
            }
 
    //this function assigns values to all the newly created new trip objects using the data gathered from the text boxes
    func createPlan(_ plan:Int) {
        let c:String = costBox.text!
        let costBoxCon:Int? = Int(c)
        if plan == 1 {
            plan1 = newTrip(destinationBox.text!, costBoxCon!, arrivalDateBox.text!, departureDateBox.text!, nameBox.text!, f: 1)
        } else if plan == 2 {
            plan2 = newTrip(destinationBox.text!, costBoxCon!, arrivalDateBox.text!, departureDateBox.text!, nameBox.text!, f: 2)
        } else if plan == 3 {
            plan3 = newTrip(destinationBox.text!, costBoxCon!, arrivalDateBox.text!, departureDateBox.text!, nameBox.text!, f: 3)
        } else if plan == 4 {
            plan4 = newTrip(destinationBox.text!, costBoxCon!, arrivalDateBox.text!, departureDateBox.text!, nameBox.text!, f: 4)
        } else if plan == 5 {
            plan5 = newTrip(destinationBox.text!, costBoxCon!, arrivalDateBox.text!, departureDateBox.text!, nameBox.text!, f: 5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //segue preparation, current_active is relative to the new trip object currently being created. so plan 1 = the first current_active, plan 2 becomes the second current_active, etc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "returnAddSegue" {
        travelVariables.active = true
            switch travelVariables.current_active {
            case 1: travelVariables.plan1active = plan1
            case 2: travelVariables.plan2active = plan2
            case 3: travelVariables.plan3active = plan3
            case 4: travelVariables.plan4active = plan4
            case 5: travelVariables.plan5active = plan5
                
            default:
                print("Max entries reached!")
            }
        }
    }
 
    //this is mainly used to load the edit mode
    override func viewDidAppear(_ animated: Bool) {
        if travelVariables.editMode == true {
            _addPlan.setTitle("Save", for: .normal)
            switch travelVariables.current_active {
            case 1: loadDetails()
            case 2: loadDetails()
            case 3: loadDetails()
            case 4: loadDetails()
            case 5: loadDetails()
            default:
                print("Kappa")
            }
        }
        
    }
    //essentially does the opposite of the previous function, brings back values from the new trip plan and assigns it to the textboxes. this is not necessary, but saves the user the time of rewriting it all
    func loadDetails() {
        
        if travelVariables.current_active == 1 {
            nameBox.text = travelVariables.plan1active.description
            arrivalDateBox.text = travelVariables.plan1active.arrivalDate
            departureDateBox.text = travelVariables.plan1active.returnDate
            destinationBox.text = travelVariables.plan1active.destination
        } else if travelVariables.current_active == 2 {
            nameBox.text = travelVariables.plan2active.description
            arrivalDateBox.text = travelVariables.plan2active.arrivalDate
            departureDateBox.text = travelVariables.plan2active.returnDate
            destinationBox.text = travelVariables.plan2active.destination

        } else if travelVariables.current_active == 3 {
            nameBox.text = travelVariables.plan3active.description
            arrivalDateBox.text = travelVariables.plan3active.arrivalDate
            departureDateBox.text = travelVariables.plan3active.returnDate
            destinationBox.text = travelVariables.plan3active.destination

        } else if travelVariables.current_active == 4 {
            nameBox.text = travelVariables.plan4active.description
            arrivalDateBox.text = travelVariables.plan4active.arrivalDate
            departureDateBox.text = travelVariables.plan4active.returnDate
            destinationBox.text = travelVariables.plan4active.destination

        } else if travelVariables.current_active == 5 {
            nameBox.text = travelVariables.plan5active.description
            arrivalDateBox.text = travelVariables.plan5active.arrivalDate
            departureDateBox.text = travelVariables.plan5active.returnDate
            destinationBox.text = travelVariables.plan5active.destination

        }
        //sees which plan is being edited
        for index in 1...5 {
            if travelVariables.current_active == index {
                travelVariables.plan1active.editData()
                travelVariables.plan2active.editData()
                travelVariables.plan3active.editData()
                travelVariables.plan4active.editData()
                travelVariables.plan5active.editData()
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

}
}
