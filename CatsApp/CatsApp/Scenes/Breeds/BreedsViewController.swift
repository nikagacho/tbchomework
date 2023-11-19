//
//  BreedsViewController.swift
//  CatsApp
//
//  Created by Nikoloz Gachechiladze on 20.11.23.
//

import UIKit

class BreedsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, BreedsViewModelDelegate {
    
    //MARK: - Properties
    
    private let viewModel = BreedsViewModel()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome to CatBreeds!"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layer = UICollectionViewFlowLayout()
        layer.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layer)
        return collectionView
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        setupCollectionView()
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    //MARK: - UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
    }
    
    //MARK: - CollectionView
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BreedCustomCell.self, forCellWithReuseIdentifier: "cell2")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.breeds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! BreedCustomCell
        cell.configureCell(with: viewModel.breeds[indexPath.row].breed, country: viewModel.breeds[indexPath.row].country)
        return cell
    }
    
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 150)
    }
    
    func didFetchBreeds() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}
