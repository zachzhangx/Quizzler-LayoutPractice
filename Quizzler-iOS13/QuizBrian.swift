//
//  QuizBrian.swift
//  Quizzler-iOS13
//
//  Created by Zhang Xu on 2022/3/13.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var correctCount = 0
    
    func getQuizChoice() -> [String]{
        return quiz[questionNumber].choices
    }
    
    mutating func checkAnswer(answer : String) -> Bool{
        let realAns = quiz[questionNumber].answer
        if answer == realAns{
            correctCount += 1
            return true
        }else{
            return false
        }
    }
    
    mutating func nextQuestion(){
        questionNumber += 1
        if questionNumber == quiz.count{
            questionNumber = 0
            correctCount = 0
        }
    }
    
    func getText() -> String{
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float{
        let progressValue = Float(questionNumber+1) / Float(quiz.count)
        return progressValue
    }
    
    func getScore() -> Int{
        return correctCount
    }
}
