//
//  NewsViewModel.swift
//  AccesibleNews
//
//  Created by Nikoloz Gachechiladze on 27.12.23.
//

import Foundation
import NetworkLayerPackage

final class NewsViewModel: ObservableObject {
    //MARK: - Properties
    @Published var news: [NewsArticle] = []
    
    private let netManager = NetworkManager<NewsResponse>()
    //MARK: - Init
    init() {
        fetchNews()
    }
    
    //MARK: - Network call
    
    private func fetchNews() {
        
        let url = "https://api.thenewsapi.com/v1/news/all?api_token=jvTiWOgp2qU47kdhlFpSVVEXMfsthH8Q0zqHvd0q&published_on=2022-12-27&language=en"
        
        Task {
            do {
                let fetchedNews = try await netManager.fetchData(from: url).data
                DispatchQueue.main.async {
                    self.news = fetchedNews
                }
            } catch {
                print("Error fetching news: \(error)")
            }
        }
    }
    
}
