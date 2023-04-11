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
    var playerTotal = [Player(), Player()]
    
    let playersInGameText = UITextField()
    
    let dice1Image = UIImageView()
    let dice2Image = UIImageView()
    let dice3Image = UIImageView()
    
    var dieLabel1 = UILabel()
    var dieLabel2 = UILabel()
    var dieLabel3 = UILabel()
    
    let player1Label = UILabel()
    let player2Label = UILabel()
    
    let player1ScoreLabel = UILabel()
    let player2ScoreLabel = UILabel()
    
    let player1RollsLabel = UILabel()
    let player2RollsLabel = UILabel()
    
    var player1Rolls = 3
    var player2Rolls = 3
    
    var player1Score = 0
    var player2Score = 0
    
    var counterForEnd = 0
    var winnerPoints = 0
    var winningPlayerName = ""
    var tiedPlayersNames = [String]()
    var tiedPlayersScore = 0
    
    var currentPlayer: Player = Player()
    var player = Player()
    // alert for when game ends
    
    var dialogMessage = UIAlertController(title: "Game Over", message: "", preferredStyle: .alert)
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in print("Ok button tapped") })
    //MARK: Dice Roller
    
    func diceRoller() {
        for die in dice {
            die.rollDie()
        }
        dieLabel1.text = "\(dice[0].value)"
        dieLabel2.text = "\(dice[1].value)"
        dieLabel3.text = "\(dice[2].value)"
        dice1Image.image = UIImage(named: "die\(dice[0].value)")
        dice2Image.image = UIImage(named: "die\(dice[1].value)")
        dice3Image.image = UIImage(named: "die\(dice[2].value)")
    }
    
    //MARK: Name adder
    
    func nameAdder() {
        for Index in 0...playerTotal.count {
            currentPlayer.playerName = "Player \(Index)"
            nextPlayer()
        }
    }
    
    //MARK: Score functions
    
    func getDoublesScore() -> Int {
        for (index, die) in dice.enumerated() {
            
            for (checkIndex, checkDie) in dice.enumerated() {
                if die.value == checkDie.value && index != checkIndex {
                    return (die.value * 10) + checkDie.value
                } else {
                    
                }
            }
        }
        return 0
    }
    
    func getTriplesScore() -> Int {
        if dice[0].value == dice[1].value && dice[0].value == dice[2].value {
            return dice[0].value * 111
        }
        return 0
    }
    
//    func getStraightScore() -> Int {
//
//    }
    
    //MARK: Rolls left
    
    func rollsLeft() {
        
        if  currentPlayer.playerRolls > 0 {
            currentPlayer.playerRolls -= 1
            player1RollsLabel.text = "Rolls left: \(currentPlayer.playerRolls)"
        } else {
            dice1Image.image = UIImage(named: "die1")
            dice2Image.image = UIImage(named: "die1")
            dice3Image.image = UIImage(named: "die1")
            nextPlayer()
            player1RollsLabel.text = "Rolls left: \(currentPlayer.playerRolls)"
            
        }
    }
    
    func nextPlayer() {
        let tempPlayer = playerTotal[0]
        playerTotal.remove(at: 0)
        currentPlayer = playerTotal[0]
        playerTotal.append(tempPlayer)
        player1Label.text = "\(currentPlayer.playerName) Score: \(currentPlayer.playerScore)"
    }
    
    func addScoreToPlayer() {
        if currentPlayer.playerScore < getTriplesScore() {
            currentPlayer.playerScore = getTriplesScore()
            player1Label.text = "\(currentPlayer.playerName) Score: \(currentPlayer.playerScore)"
        }
        if currentPlayer.playerScore < getDoublesScore() {
            currentPlayer.playerScore = getDoublesScore()
            player1Label.text = "\(currentPlayer.playerName) Score: \(currentPlayer.playerScore)"
        } else {
            
        }
        
    }
    
    func endGame() {
        if endGameChecker() == counterForEnd{
            winner()
            
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    func endGameChecker() -> Int {
        var counter = 0
        for _ in 0..<playerTotal.count {
            counter += 4
            
        }
        return counter
    }
    
    func winner() {
        if currentPlayer.playerScore > winnerPoints {
            winnerPoints = currentPlayer.playerScore
            winningPlayerName = currentPlayer.playerName
            tiedPlayersNames.removeAll()
            tiedPlayersScore = winnerPoints
            tiedPlayersNames.append(winningPlayerName)
        }else if currentPlayer.playerScore == winnerPoints && !tiedPlayersNames.contains(currentPlayer.playerName) {
            tiedPlayersNames.append(",")
            tiedPlayersNames.append(currentPlayer.playerName)
            tiedPlayersScore = currentPlayer.playerScore
        }
        if tiedPlayersScore == winnerPoints && tiedPlayersNames.count < 2 {
            dialogMessage.message = "\(winningPlayerName) won with a score of \(winnerPoints)"

        } else {
            
            dialogMessage.message = "\(tiedPlayersNames.toPrint) tied with a score of \(tiedPlayersScore)"

        }
    }
    
    func tappedCounter() {
        counterForEnd += 1
    }
    
    //MARK: Player counter alert
    
    func playerCountAlert() {
       let playerAlert = UIAlertController(title: "How Many Robbers Are There", message: "Put total down below", preferredStyle: .alert)
        playerAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            guard let field = playerAlert.textFields, field.count == 1 else {
                return
            }
            let playerCountField = field[0]
            guard let playerCount = playerCountField.text, !playerCount.isEmpty else {
                print("Invalid entries")
                return
            }
            let playerCountInt = Int(playerCount)
            if playerCountInt! > 10 {
                let lessPlayersAlert = UIAlertController(title: "Too many players must be below 10", message: "", preferredStyle: .alert)
                lessPlayersAlert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(lessPlayersAlert, animated: true)
                
            } else {
                for _ in 1...(playerCountInt ?? 0) {
                    self.playerTotal.append(Player())
                    print(playerCount)
                    print(self.playerTotal)
                }
                self.playerTotal.removeLast()
                self.playerTotal.removeLast()
                self.nameAdder()
            }
        }))
        playerAlert.addTextField { field in
            field.placeholder = "Player Count"
            field.returnKeyType = .continue
            field.keyboardType = .numberPad
        }
        present(playerAlert, animated: true)
    }
    
    
    
    @objc func rollDieButton(sender : UIButton) {
        diceRoller()
        addScoreToPlayer()
        rollsLeft()
        winner()
        tappedCounter()
        endGame()
    }
    
    @objc func passButtonTapped(sender : UIButton) {
        dice1Image.image = UIImage(named: "die1")
        dice2Image.image = UIImage(named: "die1")
        dice3Image.image = UIImage(named: "die1")
        nextPlayer()
        player1RollsLabel.text = "Rolls left: \(currentPlayer.playerRolls)"
    }
    
        //MARK: ViewDidLoad

    override func viewDidLoad(){
        
        playerCountAlert()

        
        currentPlayer = playerTotal[0]
        view.accessibilityIdentifier = "GameViewController"
        view.backgroundColor = .white
        
        dialogMessage.addAction(ok)
        
        
        //MARK: Images for dice
        dice1Image.image = UIImage(named: "die1")
        dice2Image.image = UIImage(named: "die1")
        dice3Image.image = UIImage(named: "die1")
        
        view.addSubview(dice1Image)
        let dice1Constraints = [
            dice1Image.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -80),
            dice1Image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dice1Image.widthAnchor.constraint(equalToConstant: 100),
            dice1Image.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(dice1Constraints)
        dice1Image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dice2Image)
        let dice2Constraints = [
            dice2Image.centerYAnchor.constraint(equalTo: dice1Image.centerYAnchor),
            dice2Image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dice2Image.widthAnchor.constraint(equalToConstant: 100),
            dice2Image.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(dice2Constraints)
        dice2Image.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dice3Image)
        let dice3Constraints = [
            dice3Image.centerYAnchor.constraint(equalTo: dice1Image.centerYAnchor),
            dice3Image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dice3Image.widthAnchor.constraint(equalToConstant: 100),
            dice3Image.heightAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(dice3Constraints)
        dice3Image.translatesAutoresizingMaskIntoConstraints = false
        
        
        //MARK: Roll button
        let rollButton = UIButton()
        view.addSubview(rollButton)
        rollButton.setTitle("Roll Dice", for: .normal)
        rollButton.backgroundColor = .black
        rollButton.layer.cornerRadius = 20
        let rollButtonConstraints = [
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.topAnchor.constraint(equalTo: view.centerYAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
            rollButton.widthAnchor.constraint(equalToConstant: 100)]
        NSLayoutConstraint.activate(rollButtonConstraints)
        rollButton.addTarget(self, action: #selector(self.rollDieButton(sender:)), for: .touchUpInside)
        rollButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        let passButton = UIButton()
        view.addSubview(passButton)
        passButton.setTitle("Pass", for: .normal)
        passButton.backgroundColor = .black
        passButton.layer.cornerRadius = 20
        let passButtonConstraints = [
            passButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passButton.topAnchor.constraint(equalTo: rollButton.bottomAnchor, constant: 20),
            passButton.heightAnchor.constraint(equalToConstant: 50),
            passButton.widthAnchor.constraint(equalToConstant: 100)]
        NSLayoutConstraint.activate(passButtonConstraints)
        passButton.addTarget(self, action: #selector(self.passButtonTapped(sender:)), for: .touchUpInside)
        passButton.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: PlayerLabels / Scores
        player1Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(player1Label)
        player1Label.text = "\(currentPlayer.playerName) Score: \(currentPlayer.playerScore)"
        player1Label.textColor = .black
        player1Label.font = UIFont(name: "arial", size: 20)
        let player1LabelContraints = [
            player1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            player1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(player1LabelContraints)
        
        
        
        player2Label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(player2Label)
        player2Label.text = "Player 2 Score \(player2Score)"
        player2Label.textColor = .black
        player2Label.font = UIFont(name: "arial", size: 20)
        let player2LabelContraints = [
            player2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            player2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        NSLayoutConstraint.activate(player2LabelContraints)
        
        
        view.addSubview(player1RollsLabel)
        player1RollsLabel.text = "Rolls left: \(currentPlayer.playerRolls)"
        player1RollsLabel.textColor = .black
        player1RollsLabel.font = UIFont(name: "arial", size: 20)
        let player1RollsLabelConstraints = [
            player1RollsLabel.leadingAnchor.constraint(equalTo: player1Label.leadingAnchor),
            player1RollsLabel.topAnchor.constraint(equalTo: player1Label.bottomAnchor)]
        player1RollsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(player1RollsLabelConstraints)
        
        view.addSubview(player2RollsLabel)
        player2RollsLabel.text = "Rolls left: \(player2Rolls)"
        player2RollsLabel.textColor = .black
        player2RollsLabel.font = UIFont(name: "arial", size: 20)
        let player2RollsLabelConstraints = [
            player2RollsLabel.trailingAnchor.constraint(equalTo: player2Label.trailingAnchor),
            player2RollsLabel.topAnchor.constraint(equalTo: player2Label.bottomAnchor)]
        player2RollsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(player2RollsLabelConstraints)
        
    }
    
    
    
}

