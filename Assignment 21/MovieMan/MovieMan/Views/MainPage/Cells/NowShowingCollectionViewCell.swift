//
//
//  Untitled.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

class NowShowingCollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spiderMan")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spiderman: No Way\nHome"
        label.font = UIFont(name: "Muli-Bold", size: ScreenSize.width * 0.03)
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.1/10 IMDb"
        label.font = UIFont(name: "Muli-Regular", size: ScreenSize.width * 0.025)
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
    
    //    MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Setup
    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(starSign)
        contentView.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            posterImageView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.23),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: posterImageView.trailingAnchor),
            
            starSign.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starSign.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            starSign.heightAnchor.constraint(equalTo: starSign.widthAnchor),
            starSign.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.011),
            
            ratingLabel.leadingAnchor.constraint(equalTo: starSign.trailingAnchor, constant: 3),
            ratingLabel.topAnchor.constraint(equalTo: starSign.topAnchor),
            ratingLabel.centerYAnchor.constraint(equalTo: starSign.centerYAnchor),
        ])
    }
    
    // MARK: - Configuration
    func configureNowShowingMovieCell(with movie: Movie) {
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)/10 IMDb"
        posterImageView.image = UIImage(named: movie.posterName)
    }
}

#Preview {
    NowShowingCollectionCell()
}
