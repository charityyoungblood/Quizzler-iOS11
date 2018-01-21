//
//  Question.swift
//  Quizzler
//
//  Created by Charity Youngblood  on 1/21/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation // Foundation is one of the many Swift libraries
// - you can think of libraries as Swiss Army knives - they come with certain tools that enable us to build our app
// in order to build an iOS app - you should have either import UIKit or import Foundation, at the top, along with other libraries you need depending on the app
class Question {
    // **REMEMBER to think of a class as a "blueprint" and an object is what is created from the class (blueprint)
    // the Question class will be used as a structure for all the questions in our app
    // every question instance will have a questionText and an answer(true or false)
    // inside the class we will create properties - remember properties are variables that are associated with a class
    
    // in order to initialize this class, you have to use init or assign values to the variable/constants listed
    // example questionText : String = "am I real?"
    let questionText : String // questionText is a property of Question class
    let answer : Bool // answer is a property of Question class
    
    init(text: String, correctAnswer: Bool) { // this is an event - lists what should happen once question is initialized
        questionText = text
        answer = correctAnswer
    }
    
}
