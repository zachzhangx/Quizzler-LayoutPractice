//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
        scoreLabel.text = ""

        questionLabel.text = quizBrain.getText()
        button1.setTitle(quizBrain.getQuizChoice()[0], for: UIControl.State.normal)
        button2.setTitle(quizBrain.getQuizChoice()[1], for: UIControl.State.normal)
        button3.setTitle(quizBrain.getQuizChoice()[2], for: UIControl.State.normal)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let ans = sender.currentTitle!
        let isAnswerRight = quizBrain.checkAnswer(answer: ans)

        if isAnswerRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
        
        button1.setTitle(quizBrain.getQuizChoice()[0], for: UIControl.State.normal)
        button2.setTitle(quizBrain.getQuizChoice()[1], for: UIControl.State.normal)
        button3.setTitle(quizBrain.getQuizChoice()[2], for: UIControl.State.normal)
        
        scoreLabel.text = ("Score : \(quizBrain.getScore())")
        quizBrain.nextQuestion()
        questionLabel.text = quizBrain.getText()
        progressBar.progress = quizBrain.getProgress()
    }
    
}

