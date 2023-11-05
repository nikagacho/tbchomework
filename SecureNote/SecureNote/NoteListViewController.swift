//
//  NoteListViewController.swift
//  SecureNote
//
//  Created by Nikoloz Gachechiladze on 05.11.23.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNoteViewControllerDelegate {
    
    func addedNewNote() {
            if let savedText = UserDefaults.standard.string(forKey: "savedText") {
                notes.append(savedText)
                tableView.reloadData()
            }
        }
    
    //MARK: UIElements
    
    var notes: [String] = []
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis =  .vertical
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let notesLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Notes"
        label.textColor = .black
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupDelegates()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        if let savedNotes = UserDefaults.standard.stringArray(forKey: "notesArray") {
                notes = savedNotes
            }
        
    }
    
    //MARK: Layout setup and other methods
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(notesLabel)
        mainStackView.addArrangedSubview(tableView)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let note = notes[indexPath.row]
        cell.textLabel?.text = String(note.prefix(50))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushedVC = NoteDetailsViewController()
        pushedVC.textView.text = notes[indexPath.row]
        navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    @objc func addButtonClicked() {
        let pushedVC = AddNoteViewController()
        pushedVC.delegate = self
        navigationController?.pushViewController(pushedVC, animated: true)
    }
    
 
    

}
