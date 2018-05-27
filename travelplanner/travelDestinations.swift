//
//  travelDestinations.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

class travelDestinations: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    
    //tableview that shows all the current records in the database in terms of destinations
    
    let destinations = ["Australia", "Vietnam", "Dubai", "Germany", "Russia", "China", "Brazil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = destinations[indexPath.row]
        cell?.detailTextLabel?.text = "\([indexPath.row])"
        let track_Button = UIButton()
        track_Button.setTitle("Track", for: .normal)
        track_Button.setTitleColor(UIColor.blue, for: .normal)
        track_Button.addTarget(self, action: "track_Button_Pressed:", for: .touchUpInside)
        cell?.addSubview(track_Button)
        
        return cell!
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
