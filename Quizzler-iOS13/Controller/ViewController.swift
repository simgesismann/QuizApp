//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView?
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUILabel()
        progressBar!.progress = 0
    }
    
    var quizBrain = QuizBrain()
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        var userGotItRight = quizBrain.checkAnswer(userA: userAnswer!)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        updateUILabel()
        
    }
    
    
    func updateUILabel(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){ [self] in
            self.trueButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
        }
        questionLabel.text = quizBrain.getQuestionText()
        progressBar!.progress = quizBrain.getProgress()
        scoreLabel.text = "Score is : \(quizBrain.getScore())"
        
    }

}
