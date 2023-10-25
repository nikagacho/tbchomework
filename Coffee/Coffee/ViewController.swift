//
//  ViewController.swift
//  Coffee
//
//  Created by Nikoloz Gachechiladze on 24.10.23.
//

import UIKit

class ViewController: UIViewController {
    var cappuccino: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cappuccino = Coffee(productName: "Cappuccino",
                            price: 4.59,
                            description: "From the coffee beans of Brazil, this is the aroma you've been looking for, 10/10",
                            extraInfo: "with Chocolate")
        
        infoAbout.text = cappuccino?.description
        details.text = cappuccino?.extraInfo
        price.text = "Price: $" + String(cappuccino?.price ?? 0.0)
        name.text = cappuccino?.productName
    }
    
    @IBOutlet weak var infoAbout: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    
}


