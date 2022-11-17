//
//  ViewController.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var movies: [Movie] {
        return [
            Movie(id: 2, title: "Homem Aranha", releaseDate: "2020-05-04", image: nil, overview: "", voteAverage: 5.0),
            Movie(id: 4, title: "Órfã 2: A Origem", releaseDate: "2022-07-27", image: nil, overview: "", voteAverage: 7.8),
            Movie(id: 5, title: "Minions 2: A Origem de Gru", releaseDate: "2022-06-29", image: nil, overview: "", voteAverage: 7.5),
            Movie(id: 7, title: "Thor: Amor e Trovão", releaseDate: "2020-05-04", image: nil, overview: "", voteAverage: 8.0)
        ]
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = movies[indexPath.row].title
        cell.textLabel?.textColor = .white
        cell.contentView.backgroundColor = .darkPurple
        return cell
    }
}
