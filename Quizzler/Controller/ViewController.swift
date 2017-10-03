//
//  ViewController.swift
//  Quizzler
//
//  Created by Michael Jay Abalos on 03/10/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    
    
    let questionBank = QuestionBank()
    var selectedAnswer: Bool!
    let totalItems: Int = QuestionBank().list.count
    var totalProgress: Int = 0
    var totalScore:Int = 0
    var scorePerItem: Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text =  questionBank.list[totalProgress].question
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progressView.frame.size.width = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answerPressed(sender:UIButton){
    
        selectedAnswer = sender.tag == 1 ? true : false
        
        checkAnswer()
        
    }
    
    func checkAnswer()  {
        
         if totalProgress < totalItems{
            
            if selectedAnswer ==  questionBank.list[totalProgress].answer{
                print("Correct!")
                
//                let correctAlert = UIAlertController.init(title: "Correct!", message: "Good Job!", preferredStyle: .alert)
//                let correctAnswer = UIAlertAction.init(title: "Continue", style: .default, handler: { (UIAlertAction) in
                    self.totalScore += self.scorePerItem
                    self.updateUI()
//                })
//
//                correctAlert.addAction(correctAnswer)
//                //correctAlert.view.backgroundColor = UIColor.green
//                present(correctAlert, animated: true, completion: nil)
                
            }else{
                print("Wrong!")
                
                let wrongAlert = UIAlertController.init(title: "Wrong!", message: "Try harder!", preferredStyle: .alert)
                let wrongAnswer = UIAlertAction.init(title: "Continue", style: .default, handler: { (UIAlertAction) in
                    self.totalScore += self.scorePerItem
                    self.updateUI()
                })
                
                wrongAlert.addAction(wrongAnswer)
                //wrongAlert.view.backgroundColor = UIColor.red
                present(wrongAlert, animated: true, completion: nil)
            }
         }
        
       
    }
    func updateUI() {
        
        totalProgress += 1
        print("total progress \(totalProgress)")
        if totalProgress != totalItems {
            questionLabel.text = questionBank.list[totalProgress].question
            
        }else{
            //done
            //prompt game over, then reset
            print("reset")
            
            let alert = UIAlertController.init(title: "AWESOME!", message: "Quiz will now restart...", preferredStyle: .alert)
            
            let resetAction = UIAlertAction.init(title: "OK", style: .default, handler: { (UIAlertAction) in
                self.reset()
            })
            
            alert.addAction(resetAction)
            present(alert, animated: true, completion: nil)
        }
        
        progressLabel.text = "\(totalProgress)/\(totalItems)"
        scoreLabel.text = "Score:\(totalScore)"
        progressView.frame.size.width = self.view.frame.width/CGFloat(totalItems) * CGFloat(totalProgress)
    
    }
    
    func reset(){
        totalScore = 0
        totalProgress = 0
        progressView.frame.size.width = 0
        questionLabel.text =  questionBank.list[totalProgress].question
        progressLabel.text = "\(totalProgress)/\(totalItems)"
        scoreLabel.text = "Score:\(totalScore)"
        progressView.frame.size.width = self.view.frame.width/CGFloat(totalItems) * CGFloat(totalProgress)
    }
}

