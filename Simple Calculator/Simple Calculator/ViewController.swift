//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Nakia Crumbo on 3/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstText: UITextField!
    
    @IBOutlet weak var secondText: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sumsClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                
                let result = firstNumber + secondNumber
                resultLabel.text = String(result)
                
            }
        }
    }
    
    @IBAction func minusClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                
                let result = firstNumber - secondNumber
                resultLabel.text = String(result)
                
            }
        }
    }
    
    @IBAction func multiplyClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                
                let result = firstNumber * secondNumber
                resultLabel.text = String(result)
                
            }
        }
    }
    
    @IBAction func divideClicked(_ sender: Any) {
        
        if let firstNumber = Int(firstText.text!) {
            if let secondNumber = Int(secondText.text!) {
                
                let result = firstNumber / secondNumber
                resultLabel.text = String(result)
                
            }
        }
    }
    
    


}

