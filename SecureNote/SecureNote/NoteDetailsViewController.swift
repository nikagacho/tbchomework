//
//  NoteDetailsViewController.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
     var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.textColor = .black
        textView.backgroundColor = .white
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.keyboardType = .default
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(textView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

}
