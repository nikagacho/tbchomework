//
//  ColorPalette.swift
//  TASK 16
//
//  Created by Nikoloz Gachechiladze on 27.10.23.
//

import UIKit

class ColorPalette: UIViewController {
    
    // MARK: UIElements
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let topButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let bottomButtonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Button's Background Colors"
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Home Background Color"
        return label
    }()
    
    //აქ ვცადე ლუფის დაწერა რომელიც შექმნიდა ღილაკებს და დაამატებდა ზედა და ქვედა სტეკში..ვერ ვქენი :/
    
    let grayButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let yellowButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let orangeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let grayButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let greenButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let blueButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let yellowButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let orangeButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let purpleButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    var changeButtonColors: ((UIColor) -> Void)?
    var changeBackgroundColor: ((UIColor) -> Void)?
    
    //MARK: Load view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(mainStack)
        setUpConstraints()
        setUpStacks()
        changeButtons()
        changeBackground()
    }
    
    //MARK: Methods - Layout
    
    func setUpConstraints() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.heightAnchor.constraint(equalToConstant: 300).isActive = true
        mainStack.widthAnchor.constraint(equalToConstant: 350).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
    }
    
    func setUpStacks() {
        mainStack.addArrangedSubview(topLabel)
        mainStack.addArrangedSubview(topButtonStack)
        mainStack.addArrangedSubview(bottomLabel)
        mainStack.addArrangedSubview(bottomButtonStack)
        topButtonStack.addArrangedSubview(purpleButton)
        topButtonStack.addArrangedSubview(orangeButton)
        topButtonStack.addArrangedSubview(grayButton)
        topButtonStack.addArrangedSubview(yellowButton)
        topButtonStack.addArrangedSubview(blueButton)
        topButtonStack.addArrangedSubview(greenButton)
        bottomButtonStack.addArrangedSubview(purpleButton1)
        bottomButtonStack.addArrangedSubview(orangeButton1)
        bottomButtonStack.addArrangedSubview(grayButton1)
        bottomButtonStack.addArrangedSubview(yellowButton1)
        bottomButtonStack.addArrangedSubview(blueButton1)
        bottomButtonStack.addArrangedSubview(greenButton1)
    }
    
    //MARK: Methods - Logic
    
    func changeButtons() {
        for button in topButtonStack.arrangedSubviews {
            if let button = button as? UIButton {
                button.addAction(UIAction { [weak self] _ in
                    let color = button.backgroundColor ?? .clear
                    self?.changeButtonColors?(color)
                }, for: .touchUpInside)
            }
        }
    }
    
    func changeBackground() {
        for button in bottomButtonStack.arrangedSubviews {
            if let button = button as? UIButton {
                button.addAction(UIAction { [weak self] _ in
                    let color = button.backgroundColor ?? .clear
                    self?.changeBackgroundColor?(color)
                }, for: .touchUpInside)
            }
        }
    }
    
    
}
