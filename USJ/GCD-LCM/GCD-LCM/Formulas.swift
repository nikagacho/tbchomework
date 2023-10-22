//
//  Formulas.swift
//  GCD-LCM
//
//  Created by Nikoloz Gachechiladze on 23.10.23.
//

import Foundation

func calculateGCD(a: Int, b: Int) -> Int {
    var x = a
    var y = b
    while y != 0 {
        let temp = y
        y = x % y
        x = temp
    }
    return x
}


func calculateLCM(a: Int, b: Int) -> Int {
    let x = a
    let y = b
    let lcm = (x * y) / calculateGCD(a: x, b: y)
    return lcm
}
