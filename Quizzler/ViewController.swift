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
    
    let pickedAnswer : Bool = false //initial value of false  - this can be re-assigned to another value later
    
    //Place your instance variables here
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() { // this is the first page of app so we want questions to appear here
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
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
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        // iS Question.answer or question.correctAnswer == "true"
        // answerPressed == question.answer
        let correctAnswer = allQuestions.list[0].answer
        if correctAnswer == pickedAnswer {
            print("You got it!")
        }
        else {
            
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
