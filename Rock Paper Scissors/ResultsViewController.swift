//
//  ResultsViewController.swift
//  Rock Paper Scissors
//
//  Created by Sean Williams on 27/05/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"


//MARK: - Randomly generate opponents play
static func generateOpponentsPlay() -> Shape {
    let opponentsShape = ["Rock", "Paper", "Scissors"]
    let randomValue = Int(arc4random_uniform(3))
    return Shape(rawValue: opponentsShape[randomValue])!
    }
}

class ResultsViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var imageResult: UIImageView!
    @IBOutlet private weak var labelResult: UILabel!
    
    //MARK: - Properties
   
    private let opponentsValue: Shape = Shape.generateOpponentsPlay()
    var userChoice: Shape!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //Compare the user’s play with the randomly generated play to determine a winner.
        displayResult()
        
    }
    
     private func displayResult() {
    
        var imageName: String
        var text: String
        let matchUp = "\(userChoice.rawValue) vs. \(opponentsValue.rawValue)"
        
        switch (userChoice!, opponentsValue) {
        case let (user, opponent) where user == opponent:
                text = "\(matchUp), it's a tie!"
                imageName = "itsATie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
                text = "\(matchUp), you win!"
                imageName = "\(userChoice.rawValue)-\(opponentsValue.rawValue)"
        default:
                text = "\(matchUp), you lose hombre."
                imageName = "\(opponentsValue.rawValue)-\(userChoice.rawValue)"
      
        }
        
        
        labelResult.text = text
        imageResult.image = UIImage(named: imageName)

    }
    
    //MARK: - Dismiss view controller
    @IBAction func playAgainButton(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
}


//            switch result {
//            case 1:labelResult.text = "Paper beats rock - you lose"
//            case 2: labelResult.text = "Rock beats scissors, you win!"
//            case 3: labelResult.text = "Paper beats rock, youo win!"
//            case 4: labelResult.text = "Scissors beat paper, you lose!"
//            case 5: labelResult.text = "Rock beats scissors, you lose!"
//            case 6: labelResult.text = "Scissors beat paper, you win!"
//            case 7: "Its a tie"
//            default: labelResult.text = "Its a tie"
//            }



/*
func compareHands(sender: UIButton) {
    
    let userChoice = sender.tag
    
    
    if userChoice == 1 && opponentsValue == 2 {
        result = 1
        print("Paper beats rock - you lose")
    } else if userChoice == 1 && opponentsValue == 3 {
        result = 2
        print("Rock beats scissors, you win!")
    } else if userChoice == 2 && opponentsValue == 1 {
        result = 3
        print("Paper beats rock, youo win!")
    } else if userChoice == 2 && opponentsValue == 3 {
        result = 4
        print("Scissors beat paper, you lose!")
    } else if userChoice == 3 && opponentsValue == 1 {
        result = 5
        print("Rock beats scissors, you lose!")
    } else if userChoice == 3 && opponentsValue == 2 {
        result = 6
        print("Scissors beat paper, you win!")
    } else if userChoice == opponentsValue {
        result = 7
    }
    
    switch result {
    case 1: labelText = "Paper beats rock - you lose"
    case 2: labelText = "Rock beats scissors, you win!"
    case 3: labelText = "Paper beats rock, youo win!"
    case 4: labelText = "Scissors beat paper, you lose!"
    case 5: labelText = "Rock beats scissors, you lose!"
    case 6: labelText = "Scissors beat paper, you win!"
    case 7: labelText = "Its a tie"
    default: labelText = "Error"
    }
    
    print(labelText)
}
*/
