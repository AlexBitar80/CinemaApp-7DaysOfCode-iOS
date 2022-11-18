//
//  DetailMovieViewController.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 17/11/22.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28, weight: .black)
        return label
    }()
    
    private lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: Helpers
    
    private func configureUI() {
        view.backgroundColor = .darkPurple
        view.addSubview(titleLabel)
        view.addSubview(imageMovie)
        view.addSubview(ratingLabel)
        view.addSubview(descriptionLabel)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: nil)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            imageMovie.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            imageMovie.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageMovie.heightAnchor.constraint(equalToConstant: 235),
            imageMovie.widthAnchor.constraint(equalToConstant: 175)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 32),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureImage(_ imageURL: String) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)")
        imageMovie.kf.setImage(with: url)
    }

    func getDetail(movieDetail: Movie) {
        guard let ratingTitle = movieDetail.vote_average,
              let imageURL = movieDetail.poster_path else { return }
        
        titleLabel.text = movieDetail.title
        ratingLabel.text = "Classificação dos usuários: \(ratingTitle)"
        descriptionLabel.text = movieDetail.overview
        
        configureImage(imageURL)
    }
}
