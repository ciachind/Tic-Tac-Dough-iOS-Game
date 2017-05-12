//
//  ViewController.swift
//  TicTacToe
//
//  Created by Owner on 5/12/17.
//  Copyright © 2017 Dave Ciachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var activePlayer = 1 //X dough is used for player 1
    var gameState = [0,0,0,0,0,0,0,0,0] // array for game spots
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] // setups to declare a win
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: UIButton)
    {
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true) // if game spots are 0 then game piece can be placed
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                (sender as AnyObject).setImage(UIImage(named: "X dough.jpeg"), for: UIControlState())
                activePlayer = 2 // If the player is 1 switch to player 2
            }
            else
            {
                (sender as AnyObject).setImage(UIImage(named: "donut O.jpeg"), for: UIControlState())
                activePlayer = 1 // If the player is 2 switch to player 1
            }
        }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] &&
            gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
            
                if gameState[combination[0]] == 1
                {
                // X won
                label.text = "X WON!"
                }
                else
                {
                // O won
                label.text = "O WON!"
                }
            
                playAgainButton.isHidden = false
                label.isHidden = false
                
            }
        }
        
        gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "DRAW!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any)
    {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

