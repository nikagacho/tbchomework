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
        Task {
            await runAsyncFactorialCalculations()
        }
    }

    func randomGenerator() -> Int {
        return Int.random(in: 20...50)
    }

    func factorialCounter(number: Double) async -> Double {
        var ourNumber = number
        for i in 1...Int(number - 1) {
            ourNumber *= Double(i)
        }
        return ourNumber
    }

    func runAsyncFactorialCalculations() async {
        let number1 = randomGenerator()
        let number2 = randomGenerator()

        var winner: Int?

        let result1 = await factorialCounter(number: Double(number1))
        print("Factorial of  \(number1) is \(result1)")
        winner = number1

        let result2 = await factorialCounter(number: Double(number2))
        print("Factorial of  \(number2) is \(result2)")

        if result2 < result1 {
            winner = number2
        }

        print("Winner is the thread that calculated the factorial of \(winner!).")
    }
}

