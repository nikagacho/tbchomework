//
//  ViewController.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 03.11.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: UIElements
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 218
        stackView.distribution = .fill
        return stackView
    }()
    
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Now in cinemas"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 16
        collectionView.backgroundColor = UIColor(red: 0.12, green: 0.16, blue: 0.24, alpha: 1.00)
        return collectionView
    }()
    
    //MARK: VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    //MARK: Set Up Layout
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topStackView.heightAnchor.constraint(equalToConstant: 64),
            profileButton.widthAnchor.constraint(equalToConstant: 77)
            
        ])
    }
    
    private func setupUI() {
        self.view.frame.size = .init(width: 375, height: 1086)
        view.backgroundColor = UIColor(red: 0.12, green: 0.16, blue: 0.24, alpha: 1.00)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topStackView)
        topStackView.addArrangedSubview(logoView)
        topStackView.addArrangedSubview(profileButton)
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(collectionView)
    }
    //MARK: CollectionView and Navigation
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.nameTitle.text = movies[indexPath.row].name
        cell.genreTitle.text = movies[indexPath.row].mainGenre
        cell.imageView.image = UIImage(named: movies[indexPath.row].imageName ?? "noMovie")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 163, height: 278)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsVCViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
        detailsVC.ratingLabel.text = movies[indexPath.row].rating
        detailsVC.descriptionLabel.text = movies[indexPath.row].description
        detailsVC.imageView.image = UIImage(named: movies[indexPath.row].secondImage ?? "noPhoto")
        detailsVC.certificateLabelImport.text = movies[indexPath.row].certificate
        detailsVC.runtimeLabelImport.text = movies[indexPath.row].runtime
        detailsVC.releaseLabelImport.text = movies[indexPath.row].date
        detailsVC.genreLabelImport.text = movies[indexPath.row].allGenres
        detailsVC.directorLabelImport.text = movies[indexPath.row].director
        detailsVC.castLabelImport.text = movies[indexPath.row].cast
        detailsVC.title = movies[indexPath.row].name
        let titleLabel = UILabel()
        titleLabel.text = movies[indexPath.row].name
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = UIColor.white
        detailsVC.navigationItem.titleView = titleLabel
    }
    
    
}

