//
//  ViewController.swift
//  roshambo
//
//  Created by Andres Yepes on 7/14/18.
//  Copyright © 2018 limonada_de_mango. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    enum Options: UInt32 {
        case rock, scissors, paper
    }
    
    enum Results {
        case win, tie, lost
    }
    
    func appOptionSelection() -> Options {
        let number = arc4random_uniform(3)
        return Options(rawValue: number)!
    }
    
    func winnerSelection(userOption: Options, appOption: Options) -> Results {
        if userOption == appOption {
            return .tie
        }
        else if (userOption == .paper && appOption == .rock) ||
                (userOption == .rock && appOption == .scissors) ||
                (userOption == .scissors && appOption == .paper) {
            return .win
        }
        else {
            return .lost
        }
    }
    
    @IBAction func rockAction(_ sender: Any) {
        let userOption = Options.rock
        let appOption = appOptionSelection()
        let userResult = winnerSelection(userOption: userOption, appOption: appOption)
        print("user: \(userOption) - app: \(appOption) = user \(userResult)")
        
        let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultVC.userResult = userResult
        resultVC.userOption = userOption
        
        present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func scissorsAction(_ sender: Any) {
        self.performSegue(withIdentifier: "scissors", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        let appOption = appOptionSelection()
        var userOption: Options?
        
        if segue.identifier == "scissors" {
            userOption = Options.scissors
        }
        else if segue.identifier == "paper" {
            userOption = Options.paper
        }
        
        if let userOption = userOption {
            let userResult = winnerSelection(userOption: userOption, appOption: appOption)
            print("user: \(userOption) - app: \(appOption) = user \(userResult)")
            
            resultVC.userOption = userOption
            resultVC.userResult = userResult
        }
    }
}

