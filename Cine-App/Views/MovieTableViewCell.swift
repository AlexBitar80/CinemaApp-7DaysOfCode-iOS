//
//  MovieTableViewCell.swift
//  Cine-App
//
//  Created by João Alexandre Bitar on 16/11/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Properties
   
    static var reuseIdentifier = "MovieTableViewCell"
    
    private lazy var mainStackView: UIStackView = {
         let stack = UIStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.axis = .horizontal
         [imageMovie, titleStackView].forEach { view in
             stack.addArrangedSubview(view)
         }
         stack.distribution = .fillProportionally
         stack.spacing = 16.0
         stack.alignment = .center
         return stack
    }()
    
    lazy var titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleMovie, releaseDateMovie].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 8
        stack.alignment = .leading
        return stack
    }()
    
    lazy var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "thor-image")
        image.layer.cornerRadius = 8
        return image
    }()

    lazy var titleMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .black)
        return label
    }()

    lazy var releaseDateMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        addSubview(mainStackView)

        NSLayoutConstraint.activate([
            imageMovie.heightAnchor.constraint(equalToConstant: 120),
            imageMovie.widthAnchor.constraint(equalToConstant: 90),
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
