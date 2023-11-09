//
//  ViewController.swift
//  factorialAsync
//
//  Created by Nikoloz Gachechiladze on 08.11.23.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runAsyncFactorialCalculations()
        
    }
    
    func randomGenerator() -> Int {
        return Int.random(in: 20...50)
    }
    
    func factorialCounter(number: Double) -> Double {
        var result = 1.0
        for i in 1...Int(number) {
            result *= Double(i)
        }
        return result
    }
    
    func runAsyncFactorialCalculations() {
        let number1 = randomGenerator()
        let number2 = randomGenerator()
        print("Calculations started")
        
        let calculationQueue = DispatchQueue(label: "", attributes: .concurrent)
        
        calculationQueue.async {
            let result1 = self.factorialCounter(number: Double(number1))
            print("Result One", result1)
        }
        
        calculationQueue.async {
            let result2 = self.factorialCounter(number: Double(number2))
            print("Result Two", result2)
        }
        
        calculationQueue.async {
            print("Winner is the result which prints first in the console")
        }
        
    }
    
}
    
