//
//  ViewController.swift
//  Task17
//
//  Created by Nikoloz Gachechiladze on 29.10.23.
//
// 

import UIKit

class ViewController: UIViewController, AddNewItemDelegate {
    
    func didAddNewShow() {
        tableView.reloadData()
    }
    
    
    //MARK: Properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var plusButton: UIBarButtonItem {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpConstraints()
        navigationItem.rightBarButtonItem = plusButton
    }
    
    //MARK: Methods
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        registerTableViewCells()
        view.addSubview(tableView)
    }
    
    private func registerTableViewCells() {
        tableView.register(TVShowCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc private func plusButtonTapped() {
        let newItemVC = AddNewItemToList()
        newItemVC.delegate = self
        navigationController?.pushViewController(newItemVC, animated: true)
    }
    
    
}
//MARK: Extensions
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TVShowCell
        cell.backgroundColor = .systemGray3
        let tvShow = allShows[indexPath.row]
        cell.showName.text = tvShow.name
        
        if let imageData = tvShow.imageData {
            cell.showImageView.image = UIImage(data: imageData)
        } else if let imageName = tvShow.imageName {
            cell.showImageView.image = UIImage(named: imageName)
        } else {
            cell.showImageView.image = nil
        }
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tvShow = allShows[indexPath.row]
        let itemsVC = ItemDetails()
        itemsVC.tvShowName = tvShow.name
        
        if let imageData = tvShow.imageData {
            itemsVC.logoView.image = UIImage(data: imageData)
        } else if let imageName = tvShow.imageName {
            itemsVC.logoView.image = UIImage(named: imageName)
        } else {
            itemsVC.logoView.image = nil
        }
        self.navigationController?.pushViewController(itemsVC, animated: true)
    }
}

protocol AddNewItemDelegate: AnyObject {
    func didAddNewShow()
}



