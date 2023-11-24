//
//  NewsViewController.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import UIKit

final class NewsViewController: UIViewController {
    
    // MARK: - Properties
    private var tableView: UITableView = {
        let tableView = UITableView()
//        დელეგატი და დათასორსი გადავიტანე აქედან სეთაფში
        return tableView
    }()
    
    private var news = [News]()
    private var viewModel: NewsViewModel = RealNewsViewModel()

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //ვიუმოდელის დელეგატი = სელფს
        viewModel.delegate = self
        setupTableView()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Setup TableView
    private func setupTableView() {
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "newsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - TableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
        //დავაბრუნოთ ნიუსების რაოდენობა, და არა .ზერო
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //newsCell და არა NewsCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else {
            fatalError("Could not dequeue NewsCell")
        }
        cell.configure(with: news[indexPath.row])
        return cell
    }
}

// MARK: - TableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
        //მივცეთ Height
    }
}

// MARK: - MoviesListViewModelDelegate
extension NewsViewController: NewsViewModelDelegate {
    func newsFetched(_ news: [News]) {
        self.news = news
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("error")
    }
}

