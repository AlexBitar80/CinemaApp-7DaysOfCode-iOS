//
//  ViewController.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .darkPurple
        tableView.separatorStyle = .none
        tableView.rowHeight = 140
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.barStyle = .black
        
        tableView.delegate = self
    
        configureUI()
        configureTableView()
        setConstraints()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .darkPurple
        
        title = "Filmes Populares"
        
        navigationController?.navigationBar.barStyle = .black
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .darkPurple

        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        view.addSubview(tableView)
    }
    
    func configureTableView() {
        tableView.backgroundColor = .darkPurple
        tableView.separatorStyle = .none
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
        tableView.dataSource = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Movie.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? MovieTableViewCell else { return MovieTableViewCell() }
    
        cell.titleMovie.text = Movie.movies[indexPath.row].title
        cell.releaseDateMovie.text = "Lançamento: \(Movie.movies[indexPath.row].releaseDate ?? "")"
        
        return cell
    }
}
