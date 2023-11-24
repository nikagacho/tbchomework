//
//  NewsViewModel.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

protocol NewsViewModelDelegate {
    func newsFetched(_ news: [News])
    func showError(_ error: Error)
}

protocol NewsViewModel {
    var delegate: NewsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class RealNewsViewModel: NewsViewModel {
    
    // MARK: - Properties
    private let newsAPI = "https://newsapi.org/v2/everything?q=tesla&from=2023-11-11&sortBy=publishedAt&apiKey=ce67ca95a69542b484f81bebf9ad36d5"
    private var newsList = [News]()

    var delegate: NewsViewModelDelegate?

    // MARK: - Public Methods
    func viewDidLoad() {
    //რატომ იყოოო ჩაკომენტარებულიიი
        fetchNews()
    }
    
    // MARK: - Private Methods
    private func fetchNews() {
        NetworkManager.shared.get(url: newsAPI) { [weak self] (result: Result<Article, Error>) in
            switch result {
            case .success(let article):
//ადგილები გაეცვალა appendს და დელეგატის ხაზს
                self?.newsList.append(contentsOf: article.articles)
                print("Fetched news: \(String(describing: self?.newsList.first?.title))")
                self?.delegate?.newsFetched(self!.newsList)
            case .failure(let error):
                print("Error fetching news: \(error)")
                self?.delegate?.showError(error)
            }
        }
    }
}

