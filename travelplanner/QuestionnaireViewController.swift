//
//  QuestionnaireViewController.swift
//  travelplanner
//
//  Copyright © 2018 Nemanja. All rights reserved.
//

import UIKit

//questionnaire, results are saved and then manipulated in different screens
class QuestionnaireViewController: UIViewController {

    
    //connections
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var photo_background: UIImageView!
    @IBOutlet weak var save_notify: UILabel!
    @IBOutlet weak var _continue: UIButton!
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var lb2: UILabel!
    
    @IBAction func `continue`(_ sender: UIButton) {
    }
    
    //answers are stored in this array
    var qAnswer:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        qAnswer = []
    }
    
    //list of base questions
    var questions = ["How would you describe your personality?", "What does your budget look like?", "What does your ideal travel destination sound like?", "How interested are you in travelling?"]
    //list of base answers
    var answers = [["Energetic", "Discoverer", "Fast Paced", "Individualistic"], ["High", "Medium", "Low"], ["Sunny", "Cold", "Urban", "Regional"], ["Very", "Average", "Not very"]]
    
    //counter that describes the current question
    var currentQuestion:Int = 1
    var activeQuestionName = 1
    var i:Int = 0
    
    //buttons, dynamically changed (text, destination)
    @IBOutlet weak var answer_oneO: UIButton!
    @IBOutlet weak var answer_twoO: UIButton!
    @IBOutlet weak var answer_threeO: UIButton!
    @IBOutlet weak var answer_fourO: UIButton!
    @IBOutlet weak var skipQuestion: UIButton!

    //each button will look similar to this
    //saves answer in the respective array index
    @IBAction func answer_one(_ sender: Any) {
        //switch statement, corresponds to the current question counter set up earlier
        switch currentQuestion {
            //appends all answers based from this interaction into a array
        case 1: qAnswer.append(answers[0][0]); currentQuestion = currentQuestion + 1
        case 2: qAnswer.append(answers[1][0]); currentQuestion = currentQuestion + 1
        case 3: qAnswer.append(answers[2][0]); currentQuestion = currentQuestion + 1
        case 4: qAnswer.append(answers[3][0]); setCompletion()
        default:
            //in case there are no questions available
            print("There are no questions")
        }
        //once switch ends, the next question is loaded
        loadQuestion(currentQuestion)
    }
    
    @IBAction func answer_two(_ sender: UIButton) {
        switch currentQuestion {
        case 1: qAnswer.append(answers[0][1]); currentQuestion = currentQuestion + 1
        case 2: qAnswer.append(answers[1][1]); currentQuestion = currentQuestion + 1
        case 4: qAnswer.append(answers[3][1]); setCompletion()

        default:
            print("There are no questions")
        }
        loadQuestion(currentQuestion)
    }
    
    @IBAction func answer_three(_ sender: UIButton) {
        switch currentQuestion {
        case 1: qAnswer.append(answers[0][2]); currentQuestion = currentQuestion + 1
        case 2: qAnswer.append(answers[1][2]); currentQuestion = currentQuestion + 1
        case 3: qAnswer.append(answers[2][2]); currentQuestion = currentQuestion + 1
        case 4: qAnswer.append(answers[3][2]); setCompletion()
        default:
            print("There are no questions")
        }
        loadQuestion(currentQuestion)
    }
    
    @IBAction func answer_four(_ sender: UIButton) {
        switch currentQuestion {
        case 1: qAnswer.append(answers[0][3]); currentQuestion = currentQuestion + 1
        case 3: qAnswer.append(answers[2][3]); currentQuestion = currentQuestion + 1
        default:
            print("Invalid")
        }
        loadQuestion(currentQuestion)
    }

    //loads a question from the above declared array, uses the currentquestion counter as a means to decide which one. calls the update questions function
    func loadQuestion(_ currentQ:Int) {
        switch currentQ {
        case 2: updateQuestions(currentQuestion)
        case 3: updateQuestions(currentQuestion)
        case 4: updateQuestions(currentQuestion)
        default:
            print("Error")
        }
    }
    
    //this will update all the necessary variables in order to facilitate the transition in questions
    //if statements based on the currentq will decide how the variables/classes are changed
    func updateQuestions (_ currentQ:Int) {
        if currentQ == 2 {
            //changes title, background color, background image, question text and answers
            answer_oneO.setTitle(answers[1][0], for: .normal)
            answer_oneO.backgroundColor = UIColor(red:0.76, green:0.93, blue:0.75, alpha:1.0)
            answer_twoO.setTitle(answers[1][1], for: .normal)
            answer_twoO.backgroundColor = UIColor(red:0.76, green:0.93, blue:0.75, alpha:1.0)
            answer_threeO.setTitle(answers[1][2], for: .normal)
            answer_threeO.backgroundColor = UIColor(red:0.76, green:0.93, blue:0.75, alpha:1.0)
            backgroundTransition("travel_photoe")
            answer_oneO.alpha = 0.50
            answer_twoO.alpha = 0.50
            answer_threeO.alpha = 0.50
            answer_fourO.alpha = 0
            question.text = questions[1]
        }
        
        if currentQ == 3 {
            answer_oneO.setTitle(answers[2][0], for: .normal)
            answer_oneO.backgroundColor = UIColor(red:0.75, green:0.93, blue:0.93, alpha:1.0)
            answer_twoO.setTitle(answers[2][1], for: .normal)
            answer_twoO.backgroundColor = UIColor(red:0.75, green:0.93, blue:0.93, alpha:1.0)
            answer_threeO.setTitle(answers[2][2], for: .normal)
            answer_threeO.backgroundColor = UIColor(red:0.75, green:0.93, blue:0.93, alpha:1.0)
            answer_fourO.setTitle(answers[2][3], for: .normal)
            answer_fourO.backgroundColor = UIColor(red:0.75, green:0.93, blue:0.93, alpha:1.0)
            backgroundTransition("travel_photof")
            answer_fourO.alpha = 0.50
            question.text = questions[2]
        }
        
        if currentQ == 4 {
            answer_fourO.alpha = 0
            answer_oneO.setTitle(answers[3][0], for: .normal)
            answer_oneO.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
            answer_twoO.setTitle(answers[3][1], for: .normal)
            answer_twoO.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
            answer_threeO.setTitle(answers[3][2], for: .normal)
            answer_threeO.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
            backgroundTransition("travel_photoa")
            question.text = questions[3]
        }
    }
    
    //allows the background to change to a different image once the question has been answered
    //includes animations for a fade in and out effect
    func backgroundTransition(_ name:String) {
        let _name:String = name
        UIView.transition(with: self.photo_background, duration: 1, options: [.transitionCrossDissolve], animations: { self.photo_background.image = UIImage(named: _name)}, completion: nil)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.save_notify.alpha = 1.0}, completion: nil)
        
        UIView.animate(withDuration: 2, animations: {
            self.save_notify.alpha = 0}, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //called once the questionnaire is completed, prepares the user to then navigate to the main menu
    func setCompletion() {
        UIView.animate(withDuration: 0.5, animations: {
            self._continue.alpha = 1.0
            self.lb1.alpha = 1.0
            self.lb2.alpha = 1.0
        }, completion: nil)
        
        answer_oneO.alpha = 0
        answer_twoO.alpha = 0
        answer_threeO.alpha = 0
        answer_fourO.alpha = 0
        question.alpha = 0
    }
    
    //transfers the results in a segue to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuController = segue.destination as! MainMenuView
        menuController.trivia_results = qAnswer
        travelVariables.questionnaire_done = true

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
