//
//  ViewController.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//


#warning ("სამწუხაროდ გვიან დავიწყე დავალება და ვერ გამოიყურება სათანადოდ :/ გამოვასწორებ")

import UIKit
import Security

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let firstTimeLoginKey = "firstTimeLogin"
    
    private var isFirstTimeLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: firstTimeLoginKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: firstTimeLoginKey)
        }
    }
    
//MARK: UIElements
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.spacing =  40
        return stackView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.text = "SecureNote"
        return label
    }()
    
    private let usernameField: UITextField = {
        let textfield = UITextField()
        textfield.text = "Username"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .orange
        return textfield
    }()
    
    private let passwordField: UITextField = {
        let textfield = UITextField()
        textfield.text = "Password"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .orange
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
//MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()
        setupLogin()
    }


//MARK: Layout Setup
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -10),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
    
    private func setupUI() {
//        isFirstTimeLogin = true
        view.addSubview(mainStackView)
        view.backgroundColor = .white
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(usernameField)
        mainStackView.addArrangedSubview(passwordField)
        mainStackView.addArrangedSubview(loginButton)
        mainStackView.setCustomSpacing(20, after: usernameField)
    }
    
//MARK: Methods
    
    private func shakeTextField(textField: UITextField) {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = 0.5
        animation.values = [0, -5, 5, -5, 5, -3, 3, -2, 2, 0]
        textField.layer.add(animation, forKey: "shake")
    }
    
    private func displayWelcomeAlert() {
        let alert = UIAlertController(title: "Welcome!", message: "Enjoy using SecureNote.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    private func setupDelegates() {
        passwordField.delegate = self
        usernameField.delegate = self
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    @objc func loginButtonClicked() {
        let username = usernameField.text ?? ""
        let enteredPassword = passwordField.text ?? ""
        
        if !username.isEmpty && !enteredPassword.isEmpty {
            if isFirstTimeLogin {
                if KeyChainManager.savePassword(service: "SecureNote", account: username, password: enteredPassword) {
                    let pushedVC = NoteListViewController()
                    navigationController?.pushViewController(pushedVC, animated: true)
                    pushedVC.navigationItem.hidesBackButton = true
                    displayWelcomeAlert()
                    isFirstTimeLogin = false
                } else {
                    print("Password not saved")
                }
            } else {
                if let savedPassword = KeyChainManager.getPassword(service: "SecureNote", account: username), savedPassword == enteredPassword {
                    let pushedVC = NoteListViewController()
                    navigationController?.pushViewController(pushedVC, animated: true)
                    pushedVC.navigationItem.hidesBackButton = true
                } else {
                    shakeTextField(textField: usernameField)
                    shakeTextField(textField: passwordField)
                }
            }
        } else {
            shakeTextField(textField: usernameField)
            shakeTextField(textField: passwordField)
        }
    }

    
    func setupLogin() {
        let button = loginButton
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
}




