//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank() // instead of Question.new to initialize a new Question instance - use the class name and () - if there are parameters, you would add them to the parentheses, in this case QuestionBank has no parameters so we leave () blank 
    
    var pickedAnswer : Bool = false //initial value of false  - this can be re-assigned to another value later
    var questionNumber : Int = 0 // this is a counter variable - it is keeping track of the state of our app
    var score : Int = 0 // this keeps track of the score for our app
    
    //Place your instance variables here
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() { // this is the first page of app so we want questions to appear here
        super.viewDidLoad()
        
        nextQuestion()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        // in order for us to check if the user got the question right or wrong, we have to compare their selected answer versus the correct answer
        // answer == user input or user answer
        // something.tag
        // did user select tag 1 (true) or tag 2 (false)
        
        if sender.tag == 1 {
            // we will set pickedAnswer to true
            pickedAnswer = true
        }
        
        else if sender.tag == 2 {
            pickedAnswer = false 
        }
        checkAnswer()
    
        questionNumber += 1 // same as question = question + 1
        // questionNumber should increase until it reaches the length of the list array
        nextQuestion()
       
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= (allQuestions.list.count - 1){
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
            
        }
        else {
            // create alert to show user the game is over
            let alert = UIAlertController(title: "Wooo!", message: "You have finished the game. Would you like to play again?", preferredStyle: .alert)
            // to allow users to restart the quiz - you have to use UIAlertAction
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }

    func checkAnswer() {
        // iS Question.answer or question.correctAnswer == "true"
        // answerPressed == question.answer
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        
        // reset questionNumber to 0
       questionNumber = 0
        score = 0 
        // call nextQuestion() method
        nextQuestion()
    }
    

    
}
