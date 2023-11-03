//
//  CustomCell.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 03.11.23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 7.5
        return imageView
    }()
    
    var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    var nameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    var genreTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
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
    
    private func setupCell() {
        addSubview(cellStackView)
        cellStackView.addArrangedSubview(imageView)
        cellStackView.addArrangedSubview(nameTitle)
        cellStackView.addArrangedSubview(genreTitle)
        cellStackView.setCustomSpacing(4, after: nameTitle)
        addSubview(heartButton)
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: cellStackView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: cellStackView.bottomAnchor, constant: -48),
            heartButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            heartButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            heartButton.widthAnchor.constraint(equalToConstant: 30),
            heartButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func heartButtonTapped() {
        if heartButton.tintColor == .red {
            heartButton.tintColor = .white
        } else if heartButton.tintColor == .white {
            heartButton.tintColor = .red
        }
    }
    
}
