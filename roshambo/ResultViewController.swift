//
//  ResultViewController.swift
//  roshambo
//
//  Created by Andres Yepes on 7/14/18.
//  Copyright © 2018 limonada_de_mango. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    var userResult: PlayViewController.Results?
    var userOption: PlayViewController.Options?
    
    override func viewWillAppear(_ animated: Bool) {
        setResult()
        setImageResult()
    }

    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setResult() {
        if let userResult = self.userResult {
            switch userResult {
            case .win:
                self.resultLabel.text = "You won!"
            case .lost:
                self.resultLabel.text = "You lost! :("
            case .tie:
                self.resultLabel.text = "ufff a Tie!!"
            }
        }
    }
    
    func setImageResult() {
        if let userResult = self.userResult,
           let userOption = self.userOption {
            if userResult == .tie {
                self.imageResult.image = UIImage.init(named: "itsATie")
            }
            else if userResult == .win{
                switch userOption {
                case .paper:
                    self.imageResult.image = UIImage.init(named: "PaperCoversRock")
                case .rock:
                    self.imageResult.image = UIImage.init(named: "RockCrushesScissors")
                case .scissors:
                    self.imageResult.image = UIImage.init(named: "ScissorsCutPaper")
                }
            }
            else {
                switch userOption {
                case .paper:
                    self.imageResult.image = UIImage.init(named: "ScissorsCutPaper")
                case .rock:
                    self.imageResult.image = UIImage.init(named: "PaperCoversRock")
                case .scissors:
                    self.imageResult.image = UIImage.init(named: "RockCrushesScissors")
                }
            }
            
        }
    }
}
