//
//  AddNoteViewController.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//

import UIKit

class AddNoteViewController: UIViewController, UITextViewDelegate {

    weak var delegate: AddNoteViewControllerDelegate?
    
    let defaults = UserDefaults.standard
    
    //MARK: UI Elements
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = "Start Typing..."
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.textColor = .black
        textView.backgroundColor = .white
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.keyboardType = .default
        textView.isEditable = true
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    //MARK: UI Setup and other methods
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(textView)
        setupDelegates()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonClicked))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDelegates() {
        textView.delegate = self
    }
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    @objc private func saveButtonClicked() {
        if let savedText = textView.text {
            var savedNotes = UserDefaults.standard.stringArray(forKey: "notesArray") ?? [String]()
            savedNotes.append(savedText)
            UserDefaults.standard.set(savedNotes, forKey: "notesArray")
            delegate?.addedNewNote()
            navigationController?.popViewController(animated: true)
        }
        
    }
      
}
    


protocol AddNoteViewControllerDelegate: AnyObject {
    func addedNewNote()
}
