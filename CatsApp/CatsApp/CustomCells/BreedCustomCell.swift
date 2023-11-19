//
//  BreedCustomCell.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import UIKit

class BreedCustomCell: UICollectionViewCell {
    
    //MARK: - UI Elements

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.layer.cornerRadius = 8
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        return stackView
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell Setup

    private func setupCell() {
        addSubview(mainStackView)
        mainStackView.addSubview(title)
        mainStackView.addSubview(countryLabel)
        mainStackView.layer.borderWidth = 1
        mainStackView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: countryLabel.topAnchor, constant: -10),
            title.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 30)
        ])
    }

    
    func configureCell(with breed: String, country: String) {
        title.text = breed
        countryLabel.text = country
    }
    
}


