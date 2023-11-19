//
//  DetailsVCViewController.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 04.11.23.
//

import UIKit

final class DetailsVCViewController: UIViewController {
    
    var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    var imdbLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDB"
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Session", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        return button
    }()
    
    var revenueLabel: UILabel = {
        let label = UILabel()
        label.text = "Revenue"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var revenueLabelImport: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var runtimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Runtime"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var runtimeLabelImport: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var releaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Release"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var releaseLabelImport: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var budgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Budget"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var budgetLabelImport: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var certificateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var runtimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var releaseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var genreStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var directorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    var castStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setSpacings()
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        view.backgroundColor = UIColor(red: 0.12, green: 0.16, blue: 0.24, alpha: 1.00)
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(middleStackView)
        middleStackView.addArrangedSubview(ratingLabel)
        middleStackView.addArrangedSubview(imdbLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(bottomStackView)
        bottomStackView.addArrangedSubview(certificateStackView)
        certificateStackView.addArrangedSubview(revenueLabel)
        certificateStackView.addArrangedSubview(revenueLabelImport)
        bottomStackView.addArrangedSubview(runtimeStackView)
        runtimeStackView.addArrangedSubview(runtimeLabel)
        runtimeStackView.addArrangedSubview(runtimeLabelImport)
        bottomStackView.addArrangedSubview(releaseStackView)
        releaseStackView.addArrangedSubview(releaseLabel)
        releaseStackView.addArrangedSubview(releaseLabelImport)
        bottomStackView.addArrangedSubview(genreStackView)
        genreStackView.addArrangedSubview(budgetLabel)
        genreStackView.addArrangedSubview(budgetLabelImport)
        bottomStackView.addArrangedSubview(directorStackView)
        bottomStackView.addArrangedSubview(castStackView)
        mainStackView.addArrangedSubview(selectButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 210),
            selectButton.heightAnchor.constraint(equalToConstant: 56),
            bottomStackView.heightAnchor.constraint(equalToConstant: 196),
            revenueLabel.widthAnchor.constraint(equalToConstant: 72),
            runtimeLabel.widthAnchor.constraint(equalToConstant: 72),
            releaseLabel.widthAnchor.constraint(equalToConstant: 72),
            budgetLabel.widthAnchor.constraint(equalToConstant: 72),

            
        ])
        
    }
    
    private func setSpacings() {
        mainStackView.spacing = 12
        middleStackView.spacing = 2
        bottomStackView.spacing = 12
        mainStackView.setCustomSpacing(66, after: bottomStackView)
        mainStackView.setCustomSpacing(40, after: descriptionLabel)
    }
    
    
}

