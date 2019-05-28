//
//  PlayViewController.swift
//  Rock Paper Scissors
//
//  Created by Sean Williams on 27/05/2019.
//  Copyright © 2019 Sean Williams. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    //MARK: - Code only / Programmatic approach (Rock)
    
    @IBAction func playRock(_ sender: UIButton) {
        //Get results VC
        let controller: ResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "resultsViewController") as! ResultsViewController
        controller.userChoice = getUserShape(sender)
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: - Code and Segue approach (Paper)
    
    @IBAction func playPaper(_ sender: UIButton) {
    //Perform segue when paper button is tapped
    performSegue(withIdentifier: "play", sender: sender)
    }
    
    //MARK: - Segue only (Scissors)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "play" {
        let controller = segue.destination as! ResultsViewController
        controller.userChoice = getUserShape(sender as! UIButton)
        }
    }
    
    //MARK: - Get the users shape choice from button titles and assign it to userChoice variable on resultsVC
    
    func getUserShape(_ sender: UIButton) -> Shape {
        let shape = sender.title(for: UIControl.State())!
        return Shape(rawValue: shape)!
    }

}
