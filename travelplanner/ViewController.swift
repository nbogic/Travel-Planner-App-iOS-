//
//  ViewController.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var travelphotoa: UIImageView!
    var i = 1
    
    //sets the initial screen's travel image backgrounds
    var travelImages: [UIImage] = [
        UIImage(named: "travel_photoa")!,
        UIImage(named: "travel_photob")!,
        UIImage(named: "travel_photoc")!,
        UIImage(named: "travel_photod")!
    ]
    
    var animateNum: Int = 0
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.transition(with: self.travelphotoa, duration: 3, options: [.transitionCrossDissolve], animations: { self.travelphotoa.image = UIImage(named: "travel_photoi")
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

