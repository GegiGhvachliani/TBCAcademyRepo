//
//
//  MovieHeaderView.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

class MovieHeaderView: UIView {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spiderman: No Way\nHome"
        label.font = UIFont(name: "Muli-Bold", size: ScreenSize.width * 0.055)
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.1/10 IMDb"
        label.font = UIFont(name: "Muli-Regular", size: ScreenSize.width * 0.03)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starSign: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMovieHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupMovieHeaderView() {
        addSubview(titleLabel)
        addSubview(starSign)
        addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.08),
            
            starSign.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starSign.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            starSign.heightAnchor.constraint(equalTo: starSign.widthAnchor),
            starSign.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.012),
            
            ratingLabel.leadingAnchor.constraint(equalTo: starSign.trailingAnchor, constant: 3),
            ratingLabel.centerYAnchor.constraint(equalTo: starSign.centerYAnchor)
        ])
    }
    
    // MARK: - Configure
    func configureMovieHeader(title: String, rating: Double) {
        titleLabel.text = title
        ratingLabel.text = "\(rating)/10 IMDb"
    }
}

#Preview {
    MovieHeaderView()
}
