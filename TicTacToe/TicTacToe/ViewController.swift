//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userPlayer = 1
    var gameActive = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombo = [[0,1,2], [0,3,6], [0,4,8], [1,4,7], [2,5,8], [2,4,6], [3,4,5], [6,7,8]]
    
    @IBOutlet weak var gameStatus: UILabel!
    @IBAction func gridButton(_ sender: GameButton) {
        
        if gameState[sender.tag] == 0 && gameActive == true {
            gameState[sender.tag] = userPlayer
            
        if userPlayer == 1 {
            sender.setImage(UIImage.init(named: "X"), for: .normal)
            userPlayer = 2
            gameStatus.text = "Circle's Turn"
        } else {
            sender.setImage(UIImage.init(named: "circle"), for: .normal)
            userPlayer = 1
            gameStatus.text = "Cross's Turn"
        }
        
    }
        for combo in winningCombo {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                if gameState[combo[0]] == 1 {
                    gameActive = false
                    gameStatus.text = "Cross has Won!"
                } else {
                    gameStatus.text = "Circle has Won!"
                }
                allButtons.forEach { $0.isUserInteractionEnabled = false}
                playAgain.isHidden = false
                
            }
        }
        gameActive = false
        for index in gameState {
            if index == 0 {
                gameActive = true
                break
            }
        }
        
        if gameActive == false {
            gameStatus.text = "It's a Tie!!!"
            playAgain.isHidden = false
            allButtons.forEach { $0.isUserInteractionEnabled = false}
        }
    }
    
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        userPlayer = 1
        playAgain.isHidden = true
        gameStatus.text = "Cross goes First"
        allButtons.forEach { $0.isUserInteractionEnabled = true}
        for button in allButtons {
            button.setImage(nil, for: .normal)
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}
