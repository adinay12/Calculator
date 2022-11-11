//
//  ModelViewController.swift
//  Calculator
//
//  Created by Adinay on 15/6/22.
//

import UIKit

class ModelViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    
    var firstNumber: String = ""
    var secondNumber : String = ""
    var results: Int = 0
    var operation: String = ""
    var isResultFound: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    fileprivate func getNumber(_ number: String) { // Входные параметры
        if operation.isEmpty {
            firstNumber += number
            result.text = firstNumber
        } else {
            secondNumber += number
            result.text = secondNumber
        }
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        
        if  isResultFound {
            reset()
        }
        
        switch sender.tag{
        case 0:
            getNumber("0")
        case 1:
            getNumber("1")
        case 2:
            getNumber("2")
        case 3:
            getNumber("3")
        case 4:
            getNumber("4")
        case 5:
            getNumber("5")
        case 6:
            getNumber("6")
        case 7:
            getNumber("7")
        case 8:
            getNumber("8")
        case 9:
            getNumber("9")
        default:
            print("there is no such number")
        }
    }
    
    
    // Mark: Operations
    
    
    @IBAction func Operation(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            operation = "+"
        case 11:
            operation = "-"
        case 12:
            operation = "*"
        case 13:
            operation = "/"
        default:
            print("There is no such operation")
        }
    }
    
    @IBAction func findeTheResult(_ sender: UIButton) {
        
        
        guard let first = Double(firstNumber), let second = Double(secondNumber) else {
            print("Thre is no number")
            return
        }
        
        switch operation {
        case "+":
            results = Int(first + second)
            firstNumber = "\(results)"
        case "-":
            results = Int(first - second)
            firstNumber = "\(results)"
        case "*":
            results = Int(first * second)
            firstNumber = "\(results)"
        case "/":
            results = Int(first / second)
            firstNumber  = "\(results)"
        default:
            print("Idi domoi ty ustal")
        }
        
        isResultFound = true
        
        result.text = "\(results)"
    }
    
    @IBAction func clear(_ sender: UIButton) {
        reset()
        result.text = "0"
    }
    
    
    @IBAction func reveseSign(_ sender: UIButton) {
        if isResultFound {
            if results > 0 {
                results = -results
            } else {
                results = abs(results)
            }
            result.text = "\(results)"
        } else if !isResultFound && !operation.isEmpty {
            if var second = Int(secondNumber) {
                if second > 0 {
                    second = -second
                    secondNumber = "\(second)"
                } else {
                    second = abs(second)
                    secondNumber = "\(second)"
                }
                result.text = secondNumber
            }
            
        } else {
            if var first = Int(firstNumber) {
                if first > 0 {
                    first = -first
                    firstNumber = "\(first)"
                } else {
                    first = abs(first)
                    firstNumber = "\(first)"
                }
                result.text = firstNumber
            }
        }
        
    }
    
    
    func reset(){
        firstNumber = "0"
        secondNumber = "0"
        results = 0
        operation = ""
        isResultFound = false
    }
    
}


