//
//  ViewController.swift
//  rpg2-oop-exercise
//
//  Created by Eric Walters on 1/2/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var rightPlayer: UIImageView!
    @IBOutlet weak var leftPlayer: UIImageView!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var restartText: UILabel!
    
    @IBOutlet weak var leftPlayerAttackButton: UIButton!
    @IBOutlet weak var rightPlayerAttackButton: UIButton!
    
    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var rightAttackText: UILabel!
    @IBOutlet weak var leftAttackText: UILabel!
    var player1: Character!
    var player2: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCharacters()
        
    }
    
    
    @IBAction func leftAttackTapped(sender: AnyObject) {
        
        disableRightAttackButton()
        hideLeftAttackButton()
        rightPlayerAttackButton.hidden = false
        rightAttackText.hidden = false
        
        if player1.attemptAttack(player2.attackPower) {
            printLabel.text = "\(player2.name) attacked \(player1.name) for \(player2.attackPower)"
        }
        
        if !player1.isAlive {
            printLabel.text = "\(player2.name) Killed \(player1.name)"
            rightPlayer.hidden = true
            hideRightAttackButton()
            showRestartButton()
            
        }
        
    }
    
    
    @IBAction func rightAttackTapped(sender: AnyObject) {
        
        disableLeftAttackButton()
        hideRightAttackButton()
        leftPlayerAttackButton.hidden = false
        leftAttackText.hidden = false
        
        if player2.attemptAttack(player1.attackPower) {
            printLabel.text = "\(player1.name) attacked \(player2.name) for \(player1.attackPower)"
        }
        
        if !player2.isAlive {
            printLabel.text = "\(player1.name) Killed \(player2.name)"
            leftPlayer.hidden = true
            hideLeftAttackButton()
            showRestartButton()
            
        }
    }
    
    
    @IBAction func restartTapped(sender: AnyObject) {
        
        restartText.hidden = true
        restartButton.hidden = true
        regenerateCharacters()
        
    }
    
    func regenerateCharacters() {
        
        rightPlayer.hidden = false
        leftPlayer.hidden = false
        leftPlayerAttackButton.hidden = false
        leftAttackText.hidden = false
        rightPlayerAttackButton.hidden = false
        rightAttackText.hidden = false
        enableLeftButton()
        enableRightButton()
        createCharacters()
    }
    
    func createCharacters() {
        player1 = Character(startingHp: 100, attackPower: 50, name: "Eric")
        player2 = Character(startingHp: 200, attackPower: 60, name: "Annie")
    }
    
    func showRestartButton() {
        restartButton.hidden = false
        restartText.hidden = false
    }

    func disableLeftAttackButton() {
        leftPlayerAttackButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableLeftButton", userInfo: nil, repeats: false)
        
    }
    
    func disableRightAttackButton() {
        rightPlayerAttackButton.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "enableRightButton", userInfo: nil, repeats: false)
    }
    
    func enableLeftButton() {
        leftPlayerAttackButton.enabled = true
    }
    
    func enableRightButton() {
        rightPlayerAttackButton.enabled = true
    }
    
    func hideLeftAttackButton() {
        leftPlayerAttackButton.hidden = true
        leftAttackText.hidden = true
    }
    
    func hideRightAttackButton() {
        rightPlayerAttackButton.hidden = true
        rightAttackText.hidden = true
    }


}

