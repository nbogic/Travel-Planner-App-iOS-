//
//  travelPlanView.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

class test {
    var name:String = ""
    var age:Int = 0
    
    init(_ a:String, _ b:Int){
        name = a
        age = b
    }
    
    init() {
    }
}

class travelPlanView: UIViewController {
    
    @IBOutlet weak var arrivalDate: UILabel!
    @IBOutlet weak var returnDate: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var costs: UILabel!
    @IBOutlet weak var descName: UILabel!
    
    @IBOutlet weak var destinName: UILabel!
    @IBOutlet weak var _nextplan: UIButton!
    @IBOutlet weak var _previousplan: UIButton!
    @IBOutlet weak var _editPlan: UIButton!
    @IBOutlet weak var _erasePlan: UIButton!
    @IBOutlet weak var pageNum: UILabel!
    @IBOutlet weak var error1: UILabel!
    
    @IBOutlet weak var lblCountryTitle: UILabel!
    @IBOutlet weak var lblCountryDescription: UILabel!
    @IBOutlet weak var countryImg: UIImageView!
    
    var count_2 = 0
    var i = 0
    //test lines
    var person = test("Nemanja", 19)
    var person_two = test()
    
    //loads a plan: labels are changed based on the object attributes
    func loadPlan(_ num:Int) {
        func getData(_ int:Int) {
            if int == 1 {
                desc.text = travelVariables.plan1active.description
                arrivalDate.text = ("Arrival date: \(travelVariables.plan1active.arrivalDate!)")
                returnDate.text = ("Return date: \(travelVariables.plan1active.returnDate!)")
                lblCountryTitle.text = travelVariables.plan1active.description
                lblCountryDescription.text = travelVariables.plan1active.countryDescription
                countryImg.image = UIImage(named: "\(travelVariables.plan1active.imageCount)")
                destinName.text = travelVariables.plan1active.destination

                costs.text = String(travelVariables.plan1active.budget)
                
            } else if int == 2 {
                desc.text = travelVariables.plan2active.description
                arrivalDate.text = travelVariables.plan2active.arrivalDate
                returnDate.text = travelVariables.plan2active.returnDate
                lblCountryTitle.text = travelVariables.plan2active.description
                lblCountryDescription.text = travelVariables.plan2active.countryDescription
                countryImg.image = UIImage(named: "\(travelVariables.plan2active.imageCount)")
                                destinName.text = travelVariables.plan2active.destination
                
            } else if int == 3 {
                desc.text = travelVariables.plan3active.description
                arrivalDate.text = travelVariables.plan3active.arrivalDate
                returnDate.text = travelVariables.plan3active.returnDate
                lblCountryTitle.text = travelVariables.plan3active.description
                lblCountryDescription.text = travelVariables.plan3active.countryDescription
                countryImg.image = UIImage(named: "\(travelVariables.plan3active.imageCount)")
                                destinName.text = travelVariables.plan3active.destination
                costs.text = String(travelVariables.plan3active.budget)
                
            } else if int == 4 {
                desc.text = travelVariables.plan4active.description
                arrivalDate.text = travelVariables.plan4active.arrivalDate
                returnDate.text = travelVariables.plan4active.returnDate
                lblCountryTitle.text = travelVariables.plan4active.description
                lblCountryDescription.text = travelVariables.plan4active.countryDescription
                countryImg.image = UIImage(named: "\(travelVariables.plan4active.imageCount)")
                                destinName.text = travelVariables.plan3active.destination
                costs.text = String(travelVariables.plan4active.budget)
            } else if int == 5 {
                desc.text = travelVariables.plan5active.description
                arrivalDate.text = travelVariables.plan5active.arrivalDate
                returnDate.text = travelVariables.plan5active.returnDate
                lblCountryTitle.text = travelVariables.plan5active.countryTitle
                lblCountryDescription.text = travelVariables.plan5active.countryDescription
                countryImg.image = UIImage(named: "\(travelVariables.plan5active.imageCount)")
                                destinName.text = travelVariables.plan5active.destination
                costs.text = String(travelVariables.plan5active.budget)
            }
        }
        
        switch num {
        case 1: getData(num)
        case 2: getData(num)
        case 3: getData(num)
        case 4: getData(num)
        case 5: getData(num)
        default:
            print("Hi!")
        }
    }
    
    @IBAction func previousPlan(_ sender: UIButton) {
        if travelVariables.active == true {
        if travelVariables.current_active != 1 {
        travelVariables.current_active -= 1
        loadPlan(travelVariables.current_active)
        
        pageNum.text = String(travelVariables.current_active)
        }
        }
    }
    
    func returnData() {
        for _ in travelVariables.planCollection {
            if travelVariables.planCollection[count_2].confirmData() == true {
                i = count_2
            }
        }

    }
    
    //user cannot add a plan to already exiting entry, this ensures this does not occur. user should refer to the edit option
     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var inactive:[Int] = []
        returnData()
        var allowTransition:Bool = true
        if travelVariables.active == true {
            if travelVariables.current_active == i {
                inactive.append(travelVariables.current_active)
                alertUser(1)
            }
            for _ in inactive {
                if inactive[count_2] == travelVariables.current_active {
                    allowTransition = false
                } else { allowTransition = true }
            }
        }
        return allowTransition
    }
    
    @IBAction func nextPlan(_ sender: UIButton) { //changes the current active by addition, calls the load plan with newly configured variable
        if travelVariables.active == true {
        if travelVariables.current_active != 5 {
            travelVariables.current_active += 1
            loadPlan(travelVariables.current_active)
            pageNum.text = String(travelVariables.current_active)
        }
        }
    }
    
    func alertUser(_ x:Int) { //gives the user a alert, different alerts depend on the context its begin called in
        func alert_one() {
            UIView.animate(withDuration: 0.5, animations: {
                self.error1.alpha = 1.0}, completion: nil)
            
            UIView.animate(withDuration: 2, animations: {
                self.error1.alpha = 0}, completion: nil)
        }
        
        switch x {
        case 1: alert_one()
        default:
            print("Test")
        }
    }
    
    @IBAction func editPlan(_ sender: Any) {
        travelVariables.editMode = true
        
    }
    var count = 0
    @IBAction func erasePlan(_ sender: UIButton) {
        for _ in travelVariables.planCollection {
            if travelVariables.planCollection[count].placementPlan == travelVariables.current_active {
                travelVariables.planCollection[count].clearData()
                loadPlan(travelVariables.current_active)
            }
            count += 1

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person_two = person
        print(person_two.name)
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        if travelVariables.active == true {
            loadPlan(travelVariables.current_active)
                    pageNum.text = String(travelVariables.current_active)
        }
        travelVariables.editMode = false

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
