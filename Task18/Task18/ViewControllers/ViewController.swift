//
//  ViewController.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 03.11.23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    //MARK: Elements
    
    var movieOne: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieTwo: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieThree: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieFour: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieFive: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieSix: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0,revenue: 0, poster_path: "")
    var movieSeven: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    var movieEight: newMovie = newMovie(title: "", overview: "", release_date: "", runtime: 0, budget: 0, vote_average: 0, revenue: 0, poster_path: "")
    
    var filteredMovies: [newMovie] = []
    
    var isSearching: Bool {
        return !searchBar.text!.isEmpty
    }
    
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
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.isUserInteractionEnabled = true
        return searchBar
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
        searchBar.delegate = self
        Task {
            do {
                movieOne = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/11836?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieTwo = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/7214?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieThree = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/613?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieFour = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/110555?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieFive = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/10634?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieSix = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/537996?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieSeven = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/951491?api_key=4e6bf78027a30292fc9a8adf4285533b")
                movieEight = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/556574?api_key=4e6bf78027a30292fc9a8adf4285533b")
                
            } catch MovieError.invalidData {
                print("ERROR: INVALID DATA")
            } catch MovieError.invalidURL{
                print("ERROR: INVALID URL")
            } catch MovieError.invalidResponse{
                print("ERROR: INVALID RESPONSE")
            }
            
            moviesList.append(movieOne)
            moviesList.append(movieTwo)
            moviesList.append(movieThree)
            moviesList.append(movieFour)
            moviesList.append(movieFive)
            moviesList.append(movieSix)
            moviesList.append(movieSeven)
            moviesList.append(movieEight)
            
            for i in moviesList {
                print (i.title, i.runtime, i.release_date)
            }
            setupCollectionView()
            
        }
        
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
        mainStackView.addArrangedSubview(searchBar)
        mainStackView.addArrangedSubview(mainLabel)
        mainStackView.addArrangedSubview(collectionView)
    }
    //MARK: CollectionView and Navigation
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? filteredMovies.count : moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = isSearching ? filteredMovies[indexPath.row] : moviesList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.nameTitle.text = moviesList[indexPath.row].title
        cell.genreTitle.text = moviesList[indexPath.row].release_date
        if let posterPath = moviesList[indexPath.row].poster_path {
            let imageURL = "https://image.tmdb.org/t/p/w500\(posterPath)"
            cell.loadImage(from: imageURL)
        } else {
            cell.imageView.image = UIImage(named: "noMovie")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 163, height: 278)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = isSearching ? filteredMovies[indexPath.row] : moviesList[indexPath.row]
        let detailsVC = DetailsVCViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
        detailsVC.ratingLabel.text = String(moviesList[indexPath.row].vote_average)
        detailsVC.descriptionLabel.text = moviesList[indexPath.row].overview
        detailsVC.imageView.image = UIImage(named: "noPhoto")
        detailsVC.revenueLabelImport.text = String(moviesList[indexPath.row].revenue) + " $"
        detailsVC.runtimeLabelImport.text = String(moviesList[indexPath.row].runtime)
        detailsVC.releaseLabelImport.text = moviesList[indexPath.row].release_date
        detailsVC.budgetLabelImport.text = String(moviesList[indexPath.row].budget) + " $"
        detailsVC.title = moviesList[indexPath.row].title
        let titleLabel = UILabel()
        titleLabel.text = moviesList[indexPath.row].title
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = UIColor.white
        detailsVC.navigationItem.titleView = titleLabel
    }
    
    //MARK: SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredMovies = moviesList.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        collectionView.reloadData()
    }
    
    
}

