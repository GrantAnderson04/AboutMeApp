//
//  GameViewController.swift
//  AboutMe
//
//  Created by Grant Anderson on 3/31/23.
//

import Foundation
import UIKit

class GameViewController: ViewController {
    
    let dice = [Die(numberOfSides: 6), Die(numberOfSides: 6), Die(numberOfSides: 6)]
    
    let dice1Image = UIImageView()
    let dice2Image = UIImageView()
    let dice3Image = UIImageView()
    
    var dieLabel1 = UILabel()
    var dieLabel2 = UILabel()
    var dieLabel3 = UILabel()
    
    
    
    //MARK: Dice Roller
    
    func diceRoller() {

        for die in dice {
            die.rollDie()
        }
        
        dieLabel1.text = "\(dice[0].value)"
        dieLabel2.text = "\(dice[1].value)"
        dieLabel3.text = "\(dice[2].value)"
        dice1Image.image = UIImage(named: "die\(dice[0].value)")
        
//        dice2Image.image = UIImage(named: "die\(dice[1].value)")

    }
    
    override func viewDidLoad(){
        view.backgroundColor = .white
        
        //MARK: Images for dice
        
        view.addSubview(dice1Image)
        let dice1Constraints = [
            dice1Image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dice1Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dice1Image.widthAnchor.constraint(equalToConstant: 200),
            dice1Image.heightAnchor.constraint(equalToConstant: 200)
//            dice1Image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
]
        NSLayoutConstraint.activate(dice1Constraints)
        dice1Image.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        let rollButton = UIButton()
        view.addSubview(rollButton)
        rollButton.setTitle("Roll Dice", for: .normal)
        rollButton.backgroundColor = .black
        let rollButtonConstraints = [
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
        NSLayoutConstraint.activate(rollButtonConstraints)
        rollButton.addTarget(self, action: #selector(self.rollDieButton(sender:)), for: .touchUpInside)

        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dieLabel3)
        dieLabel3.text = "test"
        dieLabel3.textColor = .black
        dieLabel3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        dieLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        dieLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    @objc func rollDieButton(sender : UIButton) {
        diceRoller()
    }
    
}

