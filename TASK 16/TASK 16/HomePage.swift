//
//  HomePage.swift
//  TASK 16
//
//  Created by Nikoloz Gachechiladze on 27.10.23.
//

import UIKit

class HomePage: UIViewController {
    
    //MARK: UIElements
    
    let stackPresentPush: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 25
        return stack
    }()
    
    
    let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: Load view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackPresentPush)
        stackPresentPush.addArrangedSubview(presentButton)
        setUpPresentButton()
        stackPresentPush.addArrangedSubview(pushButton)
        setUpPushButton()
        setUpConstraints()
    }
    
    //MARK: Methods
    
    func navigateToColor() {
        let colorPalette = ColorPalette()
        colorPalette.changeButtonColors = { [weak self] color in
            self?.changeButtonColors(color)
        }
        colorPalette.changeBackgroundColor = { [weak self] color in
            self?.changeBackgroundColor(color)
        }
        present(colorPalette, animated: true)
    }
    
    func pushToColor() {
        let colorPalette = ColorPalette()
        colorPalette.changeButtonColors = { [weak self] color in
            self?.changeButtonColors(color)
        }
        colorPalette.changeBackgroundColor = { [weak self] color in
            self?.changeBackgroundColor(color)
        }
        self.navigationController?.pushViewController(colorPalette, animated: true)
    }
    
    func setUpPresentButton() {
        presentButton.addAction(UIAction(handler: { [weak self] action in
            self?.navigateToColor()
        }), for: .touchUpInside)
    }
    
    func setUpPushButton() {
        pushButton.addAction(UIAction(handler: { [weak self] action in
            self?.pushToColor()
        }), for: .touchUpInside)
    }
    
    func setUpConstraints() {
        stackPresentPush.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        stackPresentPush.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        stackPresentPush.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400).isActive = true
        stackPresentPush.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        stackPresentPush.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func changeButtonColors(_ color: UIColor) {
        presentButton.backgroundColor = color
        pushButton.backgroundColor = color
    }
    
    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
