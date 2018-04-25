//
//  ViewController.swift
//  week 7 in class
//
//  Created by Elaine Kim on 3/20/18.
//  Copyright © 2018 wnm 300. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation {
        case noop, add, subtract, multiply, divide, equal
    }
    
    var operation: Operation = .noop
    var accumulator = 0
    var reset = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func tap(_ sender: UIButton) {
        let symbol = sender.titleLabel!.text!
        var currentDisplay = self.displayLabel.text!
        
        if let digit = Int(symbol) {
            if Int(currentDisplay)! == 0 || reset {
                currentDisplay = ""
            }
            currentDisplay = currentDisplay + String(digit)
            self.displayLabel.text = currentDisplay
            reset = false
        }   else if symbol == "C" {
            self.displayLabel.text = "0"
            accumulator = 0
            operation = .noop
        }
         else {
            switch (operation) {
            case .add: accumulator = accumulator + Int(displayLabel.text!)!
            case .subtract: accumulator = accumulator - Int(displayLabel.text!)!
            case .multiply: accumulator = accumulator * Int(displayLabel.text!)!
            case .divide: accumulator = accumulator / Int(displayLabel.text!)!
            default: accumulator = Int(displayLabel.text!)!
    }
            
            if symbol == "➕" {
                operation = .add
            }   else if symbol == "➖" {
                operation = .subtract
            }   else if symbol == "✖️" {
                operation = .multiply
            }   else if symbol == "➗" {
                operation = .divide
            }
            
            reset = true
            displayLabel.text = String(accumulator)
        }
    }
}

