//
//  UITableView.swift
//  AccesibleNews
//
//  Created by Nikoloz Gachechiladze on 27.12.23.
//

import SwiftUI

struct TableView: UIViewRepresentable {
    //MARK: - ViewModel
    @ObservedObject var viewModel: NewsViewModel
    //MARK: - UIViewRepresentable methods
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(CustomNewsCell.self, forCellReuseIdentifier: "CustomNewsCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 250
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    //MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        //MARK: - Viewmodel
        var viewModel: NewsViewModel
        weak var parentController: UIViewController?
        
        init(viewModel: NewsViewModel) {
            self.viewModel = viewModel
        }
    
       //MARK: - Tableview Delegate&DataSource 
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.news.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomNewsCell", for: indexPath) as! CustomNewsCell
            let newsItem = viewModel.news[indexPath.row]
            cell.titleLabel.text = newsItem.title
            cell.descriptionLabel.text = newsItem.description
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
        
    }
}

