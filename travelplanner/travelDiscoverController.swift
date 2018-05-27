//
//  travelDiscoverController.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//
var _x_:Int = 1
import UIKit

class travelDiscoverController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var destinationNameTwo: UILabel!
    @IBOutlet weak var destinationName: UILabel!
    @IBOutlet weak var pageControlTwo: UIPageControl!
    @IBOutlet weak var scrollViewTwo: UIScrollView!
    
    @IBOutlet weak var _seeMore: UIButton!
    @IBAction func seeMoreTwo(_ sender: Any) {
    }
    
    @IBOutlet weak var bgLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    

    var defaultImages: [String] = ["1", "2", "3", "4"]
    var frame = CGRect(x:0, y:0, width:0, height:0)
    
        override func viewDidLoad() {
        super.viewDidLoad()
            //if questionnaire has been done...
            if travelVariables.questionnaire_done == true {
                //and if it hasnt been done again...
                if travelVariables.loaded_before == false {
                    //perform the function to allocate the relevant destinations
            questionnaireUpdate()
                    destinationName.text = travelVariables.currentPageTitle[0]

                    //to prevent this from ocurring again
                    travelVariables.loaded_before = true
                }

                }
            else { destinationName.text = ""; _seeMore.alpha = 0; bgView.alpha = 1; bgLabel.alpha = 1}
            //creates a carousel/slideshow
            createSlideShow(travelVariables.images, pageControl, scrollView)
            
            
            
            createSlideShow(defaultImages, pageControlTwo, scrollViewTwo)
            //default text
            destinationNameTwo.text = "Australia"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func defaultSelection() { //the standard selection if no questionnaire has been done
        let pageNumberTwo = scrollViewTwo.contentOffset.x / scrollViewTwo.frame.size.width
        pageControlTwo.currentPage = Int(pageNumberTwo)
        if pageControlTwo.currentPage == 0 {
            destinationNameTwo.text = "Australia"
            travelVariables.global_active = 1
        } else if pageControlTwo.currentPage == 1 {
            destinationNameTwo.text = "Brazil"
            travelVariables.global_active = 7
        } else if pageControlTwo.currentPage == 2 {
            destinationNameTwo.text = "China"
            travelVariables.global_active = 6
        } else if pageControlTwo.currentPage == 3 {
            destinationNameTwo.text = "Dubai"
            travelVariables.global_active = 3
        }
        print("2: \(travelVariables.global_active)")
    }
    
    //gives a value to the global active based on the location where the acceleration has ceased
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.tag == 1 {
            if travelVariables.questionnaire_done == true {
                //sets the pagenumber dimensions
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
                
        pageControl.currentPage = Int(pageNumber)
        if pageControl.currentPage == 0 {
            destinationName.text = travelVariables.currentPageTitle[0]
            travelVariables.global_active = travelVariables.tempGlobalActive[0]
        } else if pageControl.currentPage == 1 {
            destinationName.text = travelVariables.currentPageTitle[1]
            travelVariables.global_active = travelVariables.tempGlobalActive[1]
        } else if pageControl.currentPage == 2 {
            destinationName.text = travelVariables.currentPageTitle[2]
            travelVariables.global_active = travelVariables.tempGlobalActive[2]
        } else if pageControl.currentPage == 3 {
            destinationName.text = travelVariables.currentPageTitle[3]
            travelVariables.global_active = travelVariables.tempGlobalActive[3]
            
        }
            print("1: \(travelVariables.global_active)")
            } else {
                print("No recommendations.")
            }
        }
        if scrollView.tag == 2 {
            let pageNumberTwo = scrollViewTwo.contentOffset.x / scrollViewTwo.frame.size.width
            pageControlTwo.currentPage = Int(pageNumberTwo)
            if pageControlTwo.currentPage == 0 {
                destinationNameTwo.text = "Australia"
                travelVariables.global_active = 1
            } else if pageControlTwo.currentPage == 1 {
                destinationNameTwo.text = "Brazil"
                travelVariables.global_active = 7
            } else if pageControlTwo.currentPage == 2 {
                destinationNameTwo.text = "China"
                travelVariables.global_active = 6
            } else if pageControlTwo.currentPage == 3 {
                destinationNameTwo.text = "Dubai"
                travelVariables.global_active = 3
            }
            print("2: \(travelVariables.global_active)")
        }
    }
    
    @IBAction func seeMore(_ sender: Any) { //button that isnt revelant anymore
        if destinationName.text == "Australia" {
            travelVariables.global_active = 1
        } else if destinationName.text == "Vietnam" {
            travelVariables.global_active = 2
        } else if destinationName.text == "Dubai" {
            travelVariables.global_active = 3
        } else if destinationName.text == "Germany" {
            travelVariables.global_active = 4
        } else if destinationName.text == "Russia" {
            travelVariables.global_active = 5
        } else if destinationName.text == "China" {
            travelVariables.global_active = 6
        } else if destinationName.text == "Brazil" {
            travelVariables.global_active = 7
        }
    }
    var count_c = 0
    var i:Int = 0
    var a:Int = 0
    
    //global active is essentially a way to reference a destination, 1-7, and is the main method to distinguish which destination is manipulated or called
    //this function will collect the amount of times a questionnaire answer matches the categories of each destination (which as same the questionnaire options (sunny, urban, regional, etc) and will then be compared against each. whichever destination has the most count will then be put into a array, where the top 4 will be chosen (the most that correspond with the original questionnaire answers) and then tested again with each destination count, if it equals the count, appending isdone in regards to destination name, image, global_active
    func questionnaireUpdate() {
        count_c = 0
        i = 0
        a = 0
        travelVariables.tempGlobalActive = [0, 0, 0, 0]
        var australiaCount = 0
        var vietnamCount = 0
        var dubaiCount = 0
        var germanyCount = 0
        var russiaCount = 0
        var chinaCount = 0
        var brazilCount = 0
        var current_loop = 0

        for _ in (travelVariables.Australia?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Australia?.destinationCategory[count_c] {
                australiaCount = australiaCount + 1
            }
            count_c += 1
            
            if count_c == 4 {
                current_loop = 1
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.Vietnam?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Vietnam?.destinationCategory[count_c] && current_loop == 1 {
                vietnamCount = vietnamCount + 1
            }

            count_c += 1
            
            if count_c == 4 {
                current_loop = 2
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.Dubai?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Dubai?.destinationCategory[count_c] && current_loop == 2 {
                dubaiCount = dubaiCount + 1
            }

            count_c += 1
            if count_c == 4 {
                current_loop = 3
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.Germany?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Germany?.destinationCategory[count_c] && current_loop == 3 {
                germanyCount = germanyCount + 1
            }
            count_c += 1
            if count_c == 4 {
                current_loop = 4
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.Russia?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Russia?.destinationCategory[count_c] && current_loop == 4 {
                russiaCount = russiaCount + 1
            }

            count_c += 1
            if count_c == 4 {
                current_loop = 5
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.China?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.China?.destinationCategory[count_c] && current_loop == 5 {
                chinaCount = chinaCount + 1
            }

            count_c += 1
            
            if count_c == 4 {
                current_loop = 6
                count_c = 0
                break
            }
        }
        
        for _ in (travelVariables.Brazil?.destinationCategory)! {
            if travelVariables.questionnaire_results[count_c] == travelVariables.Brazil?.destinationCategory[count_c] && current_loop == 6 {
                brazilCount = brazilCount + 1
            }

            count_c += 1
            
            if count_c == 4 {
                current_loop = 7
                count_c = 0
                break
            }
        }
        
        //testing
        print(count_c)
        print("Australia: \(australiaCount)")
        print("Vietnam: \(vietnamCount)")
        print("Dubai: \(dubaiCount)")
        print("Germany: \(germanyCount)")
        print("Russia: \(russiaCount)")
        print("China: \(chinaCount)")
        print("Brazil: \(brazilCount)")
        
        var countsCollection:[Int] = [australiaCount, vietnamCount, dubaiCount, germanyCount, russiaCount, chinaCount, brazilCount]
        countsCollection.sort(by: >)
        
        let choice1 = countsCollection[0]
        let choice2 = countsCollection[1]
        let choice3 = countsCollection[2]
        let choice4 = countsCollection[3]
        
        var imageSelectors = [choice1, choice2, choice3, choice4]
        
        for _ in imageSelectors {
            if australiaCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("1")
                travelVariables.currentPageTitle.append("Australia")
                travelVariables.tempGlobalActive[a] = 1
                a += 1
                break
                }
            }
            i += 1
        }
        
        i = 0
        
        for _ in imageSelectors {
            if vietnamCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("7")
                travelVariables.currentPageTitle.append("Vietnam")
                travelVariables.tempGlobalActive[a] = 2
                a += 1
                break
                }
            }
            i += 1
        }
        
        i = 0
        
        for _ in imageSelectors {
            if dubaiCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("4")
                travelVariables.currentPageTitle.append("Dubai")
                travelVariables.tempGlobalActive[a] = 3
                a += 1
                }
            }
            i += 1
        }
        
        i = 0
        
        for _ in imageSelectors {
            if germanyCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("5")
                travelVariables.currentPageTitle.append("Germany")
                travelVariables.tempGlobalActive[a] = 4
                a += 1
                break
                }
        }
            i += 1
        }
        
        i = 0
        
        for _ in imageSelectors {
            if russiaCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("6")
                travelVariables.currentPageTitle.append("Russia")
                travelVariables.tempGlobalActive[a] = 5
                a += 1
                break
                }
            }
            i += 1
            print(i)
        }
        
        i = 0
        
        for _ in imageSelectors {
            if chinaCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("3")
                travelVariables.currentPageTitle.append("China")
                travelVariables.tempGlobalActive[a] = 6
                a += 1
                break
                }
            }
            i += 1
        }
        
        i = 0
        
        for _ in imageSelectors {
            if brazilCount == imageSelectors[i] {
                if travelVariables.images.count < 4 {
                travelVariables.images.append("2")
                travelVariables.currentPageTitle.append("Brazil")
                travelVariables.tempGlobalActive[a] = 7
                a += 1
                break
                }
            }
             i += 1
            }
        print("\(choice1), \(choice2), \(choice3), \(choice4)")
        print(travelVariables.tempGlobalActive)
    
    }
    //function that creates a carousel/slideshow like user interface, takes in multiple parameters to allow more control and flexibility
    //constructed using
    func createSlideShow(_ Img:[String], _ pageCtrl:UIPageControl, _ scrollView:UIScrollView) {
        //number of pages that is necessary
        pageCtrl.numberOfPages = Img.count
        for index in 0..<Img.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: Img[index])
            scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(Img.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //resets the global active to 0
        travelVariables.global_active = 0
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
