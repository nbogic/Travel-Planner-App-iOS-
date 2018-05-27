//
//  travelMainDiscoverController.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class travelMainDiscoverController: UIViewController {
    

    @IBOutlet weak var overview: UIView!
    @IBOutlet weak var images: UIView!
    @IBOutlet weak var activities: UIView!
    @IBOutlet weak var destinationMenu: UISegmentedControl!
    @IBOutlet weak var deals: UIView!
    @IBOutlet weak var weather: UIView!
    @IBOutlet weak var overviewDesc: UILabel!
    @IBOutlet weak var overviewTitle: UILabel!
    @IBOutlet weak var overviewVideoImage: UIImageView!
    @IBOutlet weak var overviewDescription: UILabel!
    @IBOutlet weak var travelBackground: UIImageView!
    
    @IBOutlet weak var _overviewAddReview: UIButton!
    @IBAction func overviewAddReview(_ sender: Any) {
    }
    
    @IBOutlet weak var overviewEmptyReview: UILabel!
    @IBOutlet weak var overviewReviewerName: UILabel!
    @IBOutlet weak var overviewReviewExperience: UILabel!
    
    @IBAction func overviewReviousPrevious(_ sender: Any) {
    }
    
    @IBAction func overviewReviewNext(_ sender: Any) {
    }
    
    @IBOutlet weak var imagesCurrentImage: UIImageView!
    
    @IBAction func imagesNextImage(_ sender: Any) {
    }
    
    @IBAction func imagesPreviousImage(_ sender: Any) {
    }
    
    @IBOutlet weak var imagesLocation: UILabel!
    @IBOutlet weak var imagesDateTaken: UILabel!
    @IBOutlet weak var _activitiesPageControl: UIPageControl!
    @IBAction func activitiesPageControl(_ sender: Any) {
    }
    
    @IBOutlet weak var activitiesImageOne: UIImageView!
    @IBOutlet weak var activitiesCategoryOne: UILabel!
    @IBOutlet weak var activitiesTypeOne: UILabel!
    @IBOutlet weak var activitiesLocationOne: UILabel!
    @IBOutlet weak var activitiesImageTwo: UIImageView!
    @IBOutlet weak var activitiesCategoryTwo: UILabel!
    @IBOutlet weak var activitiesTypeTwo: UILabel!
    @IBOutlet weak var activitiesLocationTwo: UILabel!
    @IBOutlet weak var activitiesImageThree: UIImageView!
    
    @IBOutlet weak var activitiesLocationThree: UILabel!
    
    @IBOutlet weak var activitiesCategoryThree: UILabel!
    
    @IBAction func _destinationMenu(_ sender: Any) { //this button will switch between all of the different tabs available. changes their alpha and they are no longer interactable
        let tagTapped = destinationMenu.selectedSegmentIndex
        switch tagTapped {
        case 0: overview.alpha = 1; images.alpha = 0; activities.alpha = 0; deals.alpha = 0; weather.alpha = 0
        case 1: overview.alpha = 0; images.alpha = 1; activities.alpha = 0; deals.alpha = 0; weather.alpha = 0
        case 2: overview.alpha = 0; images.alpha = 0; activities.alpha = 1; deals.alpha = 0; weather.alpha = 0
        case 3: overview.alpha = 1; images.alpha = 0; activities.alpha = 0; deals.alpha = 1; weather.alpha = 0
        case 4: overview.alpha = 0; images.alpha = 0; activities.alpha = 0; deals.alpha = 0; weather.alpha = 1
        default: print("")

        }
    }
    var videoPath:String = ""
    //loads/assigns all the objects
    func loadDestination() {
        if travelVariables.global_active == 1 {
            overviewDesc.text = travelVariables.Australia?.destinationDescription
            overviewTitle.text = travelVariables.Australia?.destinationName
            travelBackground.image = UIImage(named: "1")
            overviewVideoImage.image = UIImage(named: "1")
            activitiesLocationOne.text = "Sydney"
            activitiesLocationTwo.text = "Melbourne"
            activitiesLocationThree.text = "Uluru"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Urban"
            activitiesCategoryThree.text = "Regional"
            activitiesImageOne.image = UIImage(named: "sydney")
            activitiesImageTwo.image = UIImage(named: "melbourne")
            activitiesImageThree.image = UIImage(named: "uluru")
            videoPath = "australiavideo"
            imagesCurrentImage.image = UIImage(named: "uluru")
            
        } else if travelVariables.global_active == 2 {
            overviewDesc.text = travelVariables.Vietnam?.destinationDescription
            overviewTitle.text = travelVariables.Vietnam?.destinationName
            travelBackground.image = UIImage(named: "7")
            overviewVideoImage.image = UIImage(named: "7")
            activitiesLocationOne.text = "Hanoi"
            activitiesLocationTwo.text = "Ha Long Bay"
            activitiesLocationThree.text = "Ho Chi Minh City"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Regional"
            activitiesCategoryThree.text = "Urban"
            activitiesImageOne.image = UIImage(named: "hanoi")
            activitiesImageTwo.image = UIImage(named: "ha long bay")
            activitiesImageThree.image = UIImage(named: "ho chi minh city")
            videoPath = "vietnamvideo"
            imagesCurrentImage.image = UIImage(named: "hanoi")
        } else if travelVariables.global_active == 3 {
            overviewDesc.text = travelVariables.Dubai?.destinationDescription
            overviewTitle.text = travelVariables.Dubai?.destinationName
            travelBackground.image = UIImage(named: "4")
            activitiesLocationOne.text = "Burj Khalifa"
            activitiesLocationTwo.text = "Burj Al Arab"
            activitiesLocationThree.text = "Palm Islands"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Urban"
            activitiesCategoryThree.text = "Urban"
            activitiesImageOne.image = UIImage(named: "burj khalifa")
            activitiesImageTwo.image = UIImage(named: "burj al arab")
            activitiesImageThree.image = UIImage(named: "palm islands")
            overviewVideoImage.image = UIImage(named: "4")
            imagesCurrentImage.image = UIImage(named: "palm islands")
            videoPath = "dubaivideo"
        } else if travelVariables.global_active == 4 {
            overviewDesc.text = travelVariables.Germany?.destinationDescription
            overviewTitle.text = travelVariables.Germany?.destinationName
            travelBackground.image = UIImage(named: "5")
            overviewVideoImage.image = UIImage(named: "5")
            activitiesLocationOne.text = "Berlin"
            activitiesLocationTwo.text = "Munich"
            activitiesLocationThree.text = "The Black Forest"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Urban"
            activitiesCategoryThree.text = "Regional"
            activitiesImageOne.image = UIImage(named: "berlin")
            activitiesImageTwo.image = UIImage(named: "munich")
            activitiesImageThree.image = UIImage(named: "the black forest")
            videoPath = "germanyvideo"
            imagesCurrentImage.image = UIImage(named: "the black forest")
        } else if travelVariables.global_active == 5 {
            overviewDesc.text = travelVariables.Russia?.destinationDescription
            overviewTitle.text = travelVariables.Russia?.destinationName
            travelBackground.image = UIImage(named: "6")
            overviewVideoImage.image = UIImage(named: "6")
            activitiesLocationOne.text = "Saint Petersburg"
            activitiesLocationTwo.text = "Moscow"
            activitiesLocationThree.text = "Lake Baikal"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Urban"
            activitiesCategoryThree.text = "Regional"
            activitiesImageOne.image = UIImage(named: "saint petersburg")
            activitiesImageTwo.image = UIImage(named: "moscow")
            activitiesImageThree.image = UIImage(named: "lake baikal")
            videoPath = "russiavideo"
            imagesCurrentImage.image = UIImage(named: "lake baikal")
        } else if travelVariables.global_active == 6 {
            overviewDesc.text = travelVariables.China?.destinationDescription
            overviewTitle.text = travelVariables.China?.destinationName
            travelBackground.image = UIImage(named: "3")
            overviewVideoImage.image = UIImage(named: "3")
            activitiesLocationOne.text = "Shanghai"
            activitiesLocationTwo.text = "Xi'an"
            activitiesLocationThree.text = "Great Wall of China"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Regional"
            activitiesCategoryThree.text = "Regional"
            activitiesImageOne.image = UIImage(named: "shanghai")
            activitiesImageTwo.image = UIImage(named: "xi'an")
            activitiesImageThree.image = UIImage(named: "great wall of china")
            videoPath = "chinavideo"
            imagesCurrentImage.image = UIImage(named: "great wall of china")
        } else if travelVariables.global_active == 7 {
            overviewDesc.text = travelVariables.Brazil?.destinationDescription
            overviewTitle.text = travelVariables.Brazil?.destinationName
            travelBackground.image = UIImage(named: "2")
            overviewVideoImage.image = UIImage(named: "2")
            activitiesLocationOne.text = "Rio de Janeiro"
            activitiesLocationTwo.text = "Salvador"
            activitiesLocationThree.text = "Foz do Iguacu"
            activitiesCategoryOne.text = "Urban"
            activitiesCategoryTwo.text = "Urban"
            activitiesCategoryThree.text = "Regional"
            activitiesImageOne.image = UIImage(named: "rio de janeiro")
            activitiesImageTwo.image = UIImage(named: "salvador")
            activitiesImageThree.image = UIImage(named: "foz do iguacu")
            imagesCurrentImage.image = UIImage(named: "rio de janeiro")
            videoPath = "brazilvideo"
        }
    }
    
    @IBAction func activityOneButton(_ sender: Any) {
    }
    
    
    @IBAction func activityTwoButton(_ sender: Any) {
        
    }
    
    @IBAction func activityThreeButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDestination()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated:Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //play video function
    private func playVideo(_ x:String) {
        let path = Bundle.main.path(forResource: x, ofType:"mp4")
        let player = AVPlayer(url: URL(fileURLWithPath: path!))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        playVideo(videoPath)
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
