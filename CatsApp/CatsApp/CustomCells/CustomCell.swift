//
//  CustomCell.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    //MARK: - UI Elements

    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 8
            view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
            return view
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
        addSubview(containerView)
        containerView.addSubview(title)
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
                containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
                containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
                title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
                title.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
                title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10)
            ])
        }
    
    func configureCell(with catFact: String) {
        title.text = catFact
    }
}
