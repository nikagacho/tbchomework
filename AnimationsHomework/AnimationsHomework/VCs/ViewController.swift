//
//  ViewController.swift
//  AnimationsHomework
//
//  Created by Nikoloz Gachechiladze on 12.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "TBC IT Academy"
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Next Page", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        animateFade()
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
    }
    
    //MARK: - Methods
    
    private func setupUI() {
        view.backgroundColor =  .white
        view.addSubview(mainLabel)
        view.addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 230),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
    }
    
    private func animateFade() {
        UIView.animate(withDuration: 3, animations: {
            self.mainLabel.alpha = 0.0
            self.mainLabel.transform = CGAffineTransform(translationX: 0, y: 50)
        }) { _ in
            UIView.animate(withDuration: 3, delay: 0, animations: {
                self.mainLabel.alpha = 1.0
                self.mainLabel.transform = .identity
            }) { _ in
                self.animateFade()
            }
        }
    }
    
    @objc private func pushVC() {
        let pushedVC = SecondController()
        navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    
}

