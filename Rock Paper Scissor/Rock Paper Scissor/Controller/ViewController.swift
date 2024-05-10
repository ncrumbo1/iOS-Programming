//
//  ViewController.swift
//  Rock Paper Scissor
//
//  Created by Nakia Crumbo on 4/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    
    @IBOutlet weak var rockLabel: UIButton!
    @IBOutlet weak var paperLabel: UIButton!
    @IBOutlet weak var scissorLabel: UIButton!
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var scoreBoardController: ScoreBoardController?
    
    enum Choice: String {
        case rock = "ROCK"
        case paper = "PAPER"
        case scissor = "SCISSORS"
    }
    
    // Counters for rounds and total rounds
    var roundCount = 0
    var totalRounds = 3 // default value
    
    //countdown timer
    var countdownTimer: Timer?
    var countdownSeconds = 3
    
    var gameResult: String?
    
    // Declare a variable to store game results
    var gameResults: [(round: Int, result: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The tap gestures for the player buttons
        let rockTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rockButtonTapped(_:)))
            rockLabel.isUserInteractionEnabled = true
            rockLabel.addGestureRecognizer(rockTapGestureRecognizer)
        
        let paperTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(paperButtonTapped(_:)))
            paperLabel.isUserInteractionEnabled = true
            paperLabel.addGestureRecognizer(paperTapGestureRecognizer)
        
        let scissorTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scissorButtonTapped(_:)))
            scissorLabel.isUserInteractionEnabled = true
            scissorLabel.addGestureRecognizer(scissorTapGestureRecognizer)
        
        // Disable player buttons initially
        rockLabel.isEnabled = false
        paperLabel.isEnabled = false
        scissorLabel.isEnabled = false
        
        // The Computer's choice when the view loads
        computerLabel.text = "Computer"
        
        // The tap gesture recognizer for the start label
        let startTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(startLabelTapped(_:)))
            startLabel.isUserInteractionEnabled = true
            startLabel.addGestureRecognizer(startTapGestureRecognizer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Prompt the player for the number of rounds when the view appears
        promptForNumberOfRounds()
        
    }
    
    
    @IBAction func scoreButton(_ sender: Any) {
        transferGameResultsToScoreBoard()
    }

    
    // Function to prompt the player for the number of rounds
    func promptForNumberOfRounds() {
        let alertController = UIAlertController(title: "Number of Rounds", message: "Enter the number of rounds you want to play (3-20)", preferredStyle: .alert)
    
    // Add a text field to the alert controller
        alertController.addTextField { textField in
        textField.placeholder = "3-20"
            textField.keyboardType = .numberPad
        }
    
    // Add action buttons
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
    
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
    // Retrieve the inputted number of rounds from the text field
        if let textField = alertController.textFields?.first, let input = textField.text, let rounds = Int(input) {
        // Validate the input
            if (3...20).contains(rounds) {
            // Update the total rounds
                self?.totalRounds = rounds
                // Start the game with the specified number of rounds
                self?.startGame(withRounds: rounds)
            } else {
                // Show an error message if the input is invalid
                self?.showInvalidInputAlert()
            }
        } else {
            // Show an error message if the input is empty or invalid
            self?.showInvalidInputAlert()
        }
    }
    alertController.addAction(okAction)
    
    // Present the alert controller
    present(alertController, animated: true, completion: nil)
    }
    
    // Function to display an alert for invalid input
    func showInvalidInputAlert() {
        let alertController = UIAlertController(title: "Invalid Input", message: "Please enter a number between 3 and 20.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            // Prompt the player again for the number of rounds
            self?.promptForNumberOfRounds()
        })
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    // Function to start the game with the specified number of rounds
    func startGame(withRounds rounds: Int) {
        // Start the game with the specified number of rounds
        roundCount = 1 // Reset the round count
        roundLabel.text = "Round: \(roundCount)"
        startNextRound()
        roundLabel.text = "Round: \(roundCount)"
        
    }
    
    // Function to start the next round
    func startNextRound() {
        roundLabel.text = "Round: \(roundCount)"
        
        gameResult = nil
    }
    
    //Function to end the game
    func endGame() {
        // Disable player buttons
        rockLabel.isEnabled = false
        paperLabel.isEnabled = false
        scissorLabel.isEnabled = false
        
       
        
        
    }
    
    // Function to prompt the player for a new game
    func promptForNewGame() {
        let alertController = UIAlertController(title: "New Game", message: "Do you want to start a new game?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            // Start a new game
            self?.promptForNumberOfRounds()
        }
        alertController.addAction(yesAction)
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
            // Disable player buttons
            self.rockLabel.isEnabled = false
            self.paperLabel.isEnabled = false
            self.scissorLabel.isEnabled = false
            
            
        }
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func transferGameResultsToScoreBoard() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let scoreBoardController = storyboard.instantiateViewController(withIdentifier: "toScoreBoardController") as? ScoreBoardController {
            scoreBoardController.gameResults.append(contentsOf: gameResults)
            navigationController?.pushViewController(scoreBoardController, animated: true)
            
        }
    }
    

    // The player button functions
    @objc func rockButtonTapped(_ sender: UITapGestureRecognizer) {
        let playerChoice = Choice.rock
        playerLabel.text = "ROCK"
        // Simulate computer's choice after player's choice
        let computerChoice = getRandomChoice()
        computerLabel.text = "\(computerChoice.rawValue)"
        // Compare player's choice with computer's choice
        compareChoices(playerChoice: playerChoice)
        // Restart the countdown timer
        startCountdown()
        
    }
    
    @objc func paperButtonTapped(_ sender: UITapGestureRecognizer) {
        let playerChoice = Choice.paper
        playerLabel.text = "PAPER"
        // Simulate computer's choice after player's choice
        let computerChoice = getRandomChoice()
        computerLabel.text = "\(computerChoice.rawValue)"
        // Compare player's choice with computer's choice
        compareChoices(playerChoice: playerChoice)
        // Restart the countdown timer
        startCountdown()
        
    }
    
    @objc func scissorButtonTapped(_ sender: UITapGestureRecognizer) {
        let playerChoice = Choice.scissor
        playerLabel.text = "SCISSOR"
        // Simulate computer's choice after player's choice
        let computerChoice = getRandomChoice()
        computerLabel.text = "\(computerChoice.rawValue)"
        // Compare player's choice with computer's choice
        compareChoices(playerChoice: playerChoice)
        // Restart the countdown timer
        startCountdown()
    }
    
    // Function to generate a random choice for the computer
    func getRandomChoice() -> Choice {
        let choices: [Choice] = [.rock, .paper, .scissor]
        let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
        return choices[randomIndex]
    }
    
    
    // comparing choices to see the outcome
    func compareChoices(playerChoice: Choice) {
        let computerChoice = getRandomChoice()
        computerLabel.text = "\(computerChoice.rawValue)"
        // Compare player's choice with computer's choice
        if playerChoice == computerChoice {
            //will change these player and computer labels to the start label once it is implemented
            startLabel.text = "Draw!"
            gameResults.append((round: roundCount, result: "Draw"))
        } else if (playerChoice == .rock && computerChoice == .scissor) || (playerChoice == .paper && computerChoice == .rock) || (playerChoice == .scissor && computerChoice == .paper) {
            startLabel.text = "Win!"
            gameResults.append((round: roundCount, result: "Win"))
        } else {
            startLabel.text = "Lose!"
            gameResults.append((round: roundCount, result: "Lose"))
        }
        
        
        
        // Increment the round count and update the round label
        roundCount += 1
        roundLabel.text = "Round: \(roundCount)"
        
        
        // Start the next round
        if roundCount > totalRounds {
            startNextRound()
        } else {
            // End the game if all rounds are completed
            endGame()
            
        }
    }

    
    
    //The countdown start label gesture
    @objc func startLabelTapped(_ sender: UITapGestureRecognizer) {
        startCountdown()
    }
    
    func startCountdown() {
        countdownSeconds = 3 // Reset countdown value
        countdownTimer?.invalidate() // Invalidate any existing timer
        
        // Start a new timer
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            if self.countdownSeconds > 0 {
                self.startLabel.text = "\(self.countdownSeconds)"
                self.countdownSeconds -= 1
                
                // disable buttons until countdown reaches 0
                if self.countdownSeconds > 0 {
                    self.rockLabel.isEnabled = false
                    self.paperLabel.isEnabled = false
                    self.scissorLabel.isEnabled = false
                    
                }
                
            } else {
                self.startLabel.text = "GO!"
                //Enable buttons when count down reaches GO!
                self.rockLabel.isEnabled = true
                self.paperLabel.isEnabled = true
                self.scissorLabel.isEnabled = true
                self.countdownTimer?.invalidate() // Stop the timer
                
                if self.roundCount == self.totalRounds {
                    self.countdownTimer?.invalidate() // Stop the timer
                    self.startLabel.text = "Game Over!"
                    self.endGame()
                    self.promptForNewGame()

                }
            }
        }
    }
}

