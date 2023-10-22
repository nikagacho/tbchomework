//
//  ViewController.swift
//  GCD-LCM
//
//  Created by Nikoloz Gachechiladze on 22.10.23.
//
// Tested on iPhone 14 Pro

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var field1: UITextField!
    
    @IBOutlet weak var field2: UITextField!
    
    @IBOutlet weak var calculatedNum: UILabel!
    
    
    @IBOutlet weak var switchButton: UISwitch!
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            topLabel.text = "Greatest Common Divisor"
            
        }
        else {
            topLabel.text = "Least Common Multiple"
        }
    }
    
    @IBAction func button(_ sender: Any) {
           if switchButton.isOn {
               if let textfieldInt = Int(field1.text ?? ""), let textfield2Int = Int(field2.text ?? "") {
                   let gcd = calculateGCD(a: textfieldInt, b: textfield2Int)
                   calculatedNum.text = String(gcd)
                   field1.textColor = UIColor.black
                   field2.textColor = UIColor.black
               }
               else
               {
                   calculatedNum.text = "Invalid input"
                   field1.textColor = UIColor.red
                   field2.textColor = UIColor.red
               }
            }
             else
             {
               if let textfieldInt = Int(field1.text ?? ""), let textfield2Int = Int(field2.text ?? "") {
                   let lcm = calculateLCM(a: textfieldInt, b: textfield2Int)
                   calculatedNum.text = String(lcm)
                   field1.textColor = UIColor.black
                   field2.textColor = UIColor.black
               } else {
                   calculatedNum.text = "Invalid input"
                   field1.textColor = UIColor.red
                   field2.textColor = UIColor.red
               }
           }
       }
    
    
}


