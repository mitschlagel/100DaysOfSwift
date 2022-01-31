//
//  ViewController.swift
//  Project2
//
//  Created by Spencer Jones on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var numQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "united kingdom", "united states"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + " Current Score: \(score)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if numQuestions == 10 {
            title = "Game Over"
            numQuestions = 0
            score = 0
            let gameOver = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
            gameOver.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            present(gameOver, animated: true)
            
        } else {
            numQuestions += 1
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
                
            } else {
                title = "Wrong! That's the flag of \(countries[sender.tag].capitalized)!"
                score -= 1
            }
            
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        
    }
    
}

