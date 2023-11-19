//
//  ViewModel.swift
//  Task18
//
//  Created by Nikoloz Gachechiladze on 19.11.23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didFetchMovies(_ movies: [newMovie])
    func didFailFetchingMovies(error: Error)
}

final class ViewModel {
    
    private var movies: [newMovie] = []
    private var filteredMovies: [newMovie] = []
    
    weak var delegate: ViewModelDelegate?

    func viewDidLoad() {
        Task {
            do {
                try await fetchMovies()
            } catch {
                delegate?.didFailFetchingMovies(error: error)
            }
        }
    }

    func fetchMovies() async throws {
        do {
            let movieOne = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/11836?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieTwo = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/7214?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieThree = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/613?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieFour = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/110555?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieFive = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/10634?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieSix = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/537996?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieSeven = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/951491?api_key=4e6bf78027a30292fc9a8adf4285533b")
            let movieEight = try await getMovie(homeURL: "https://api.themoviedb.org/3/movie/556574?api_key=4e6bf78027a30292fc9a8adf4285533b")
            
            movies = [movieOne, movieTwo, movieThree, movieFour, movieFive, movieSix, movieSeven, movieEight]
            filteredMovies = movies
            notifyDelegate(with: movies)
        } catch {
            notifyErrorDelegate(error: error)
        }
    }
    
    
    private func notifyDelegate(with movies: [newMovie]) {
        delegate?.didFetchMovies(movies)
    }
    
    private func notifyErrorDelegate(error: Error) {
        delegate?.didFailFetchingMovies(error: error)
    }
   }
    
    



