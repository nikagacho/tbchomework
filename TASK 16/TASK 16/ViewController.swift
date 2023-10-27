//
//  ViewController.swift
//  TASK 16
//
//  Created by Nikoloz Gachechiladze on 26.10.23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - UI Elements
    
    let loginStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let socialsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Sign In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        return button
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26)
        return label
    }()
    
    let forgotPass: UILabel = {
        let label = UILabel()
        label.text = "Forgot your password?"
        label.textAlignment = .right
        return label
    }()
    
    let emailField: UITextField = {
        let textfield = UITextField()
        textfield.text = "E-Mail"
        textfield.borderStyle = .roundedRect
        textfield.tintColor = .gray
        textfield.backgroundColor = .lightGray
        return textfield
    }()
    
    let passwordField: UITextField = {
        let textfield = UITextField()
        textfield.text = "Password"
        textfield.borderStyle = .roundedRect
        textfield.tintColor = .gray
        textfield.backgroundColor = .lightGray
        return textfield
    }()
    
    let orBreak: UILabel = {
        let label = UILabel()
        label.text = "-------Or-------"
        label.textAlignment = .center
        return label
    }()
    
    let noAccount: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Sign up"
        label.textAlignment = .center
        return label
    }()
    
    let facebookIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "facebook")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let googleIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "google")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let linkedinIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "linkedin")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let manIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "man")
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    func signInClicked() {
        let homePageVC = HomePage()
        if emailField.text != "" && passwordField.text != "" && emailField.text != "E-mail" && passwordField.text != "Password" {
            navigationController?.pushViewController(homePageVC, animated: true)
        }
    }
    
    //MARK: Load view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginStack)
        view.backgroundColor = .white
        setUpConstraints()
        setUpStacks()
        setCustomSpacings()
        setUpDelegates()
        let signInAction = UIAction { [weak self] action in
            self?.signInClicked()
        }
        buttonSignIn.addAction(signInAction, for: .touchUpInside)
        
    }
    
    //MARK: Methods
    
    func setUpConstraints() {
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        let leadingConstraint = loginStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52)
        let trailingConstraint = loginStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52)
        let bottomConstraint = loginStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -95)
        let topConstraint = loginStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 99)
        trailingConstraint.isActive = true
        bottomConstraint.isActive = true
        leadingConstraint.isActive = true
        topConstraint.isActive = true
    }
    
    func setCustomSpacings() {
        loginStack.setCustomSpacing(15, after: manIcon)
        loginStack.setCustomSpacing(15, after: emailField)
        loginStack.setCustomSpacing(15, after: passwordField)
        loginStack.setCustomSpacing(14, after: orBreak)
        loginStack.setCustomSpacing(65, after: socialsStack)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func setUpStacks() {
        loginStack.addArrangedSubview(manIcon)
        loginStack.addArrangedSubview(topLabel)
        loginStack.addArrangedSubview(emailField)
        loginStack.addArrangedSubview(passwordField)
        loginStack.addArrangedSubview(forgotPass)
        loginStack.addArrangedSubview(buttonSignIn)
        loginStack.addArrangedSubview(orBreak)
        loginStack.addArrangedSubview(socialsStack)
        loginStack.addArrangedSubview(noAccount)
        socialsStack.addArrangedSubview(facebookIcon)
        socialsStack.addArrangedSubview(googleIcon)
        socialsStack.addArrangedSubview(linkedinIcon)
    }
    
    func setUpDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
}




