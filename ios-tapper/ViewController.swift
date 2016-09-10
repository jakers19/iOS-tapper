//
//  ViewController.swift
//  ios-tapper
//
//  Created by Jake Simon on 9/9/16.
//  Copyright © 2016 Jake Simon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //properties
    var maxTaps = 0
    var currentTaps = 0
    
    //outlets
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!
    
    // IBAction Functions
    // tapping the coin to increase the number until you hit the designated maximum, if max hit, start game over
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps += 1
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    // start the game
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.hidden = true
            playBtn.hidden = true
            howManyTapsTxt.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            maxTaps = Int(howManyTapsTxt.text!)!
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    // counter label
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    // check to see if you've hit max
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
     // go back to title screen if game is over
    
        func restartGame() {
            maxTaps = 0
            howManyTapsTxt.text = ""
            
            logoImg.hidden = false
            playBtn.hidden = false
            howManyTapsTxt.hidden = false
            
            tapBtn.hidden = true
            tapsLbl.hidden = true
        }
}

