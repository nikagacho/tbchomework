//
//  ItemDetails.swift
//  Task17
//
//  Created by Nikoloz Gachechiladze on 29.10.23.
//

import UIKit

class ItemDetails: UIViewController {
    
    //MARK: Properties
    var tvShowName: String?
    var tvShowImageName: String?
    
    private var nameTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 26)
        label.textColor = .purple
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpConstraints()
        setUpName()
        
    }
    
    //MARK: Set up layout
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            nameTitle.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10),
            logoView.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 10), //
            logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            logoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
    }
    
    private func setUpName() {
        nameTitle.text = tvShowName
        
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(nameTitle)
        view.addSubview(logoView)

    }
    
    
}
