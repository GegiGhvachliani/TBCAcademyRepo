//
//  PopularTableViewCell.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var tappedMovie: Movie?
    
    var posterTap: ((Movie) -> ())?
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "venom")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Venom Let There Be Carnage"
        label.font = UIFont(name: "Mulish-Bold", size: ScreenSize.width * 0.04)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "6.4/10 IMDb"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.03)
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
    
    private let genresStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let posterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "picture"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let clockIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "time")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "1h 47m"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.03)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.contentMode = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableView()
        configurePosterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(starSign)
        contentView.addSubview(genresStackView)
        contentView.addSubview(durationStackView)
        contentView.addSubview(posterButton)
        
        durationStackView.addArrangedSubview(clockIcon)
        durationStackView.addArrangedSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            // setup poster image
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            posterImageView.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.25),
            posterImageView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.17),
            
            // setup title label
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: posterButton.leadingAnchor, constant: -16),
            
            // setup rating view
            starSign.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            starSign.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            starSign.heightAnchor.constraint(equalTo: starSign.widthAnchor),
            starSign.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.012),
            
            ratingLabel.leadingAnchor.constraint(equalTo: starSign.trailingAnchor, constant: 3),
            ratingLabel.centerYAnchor.constraint(equalTo: starSign.centerYAnchor),
            
            // setup genre stacView
            genresStackView.leadingAnchor.constraint(equalTo: starSign.leadingAnchor),
            genresStackView.topAnchor.constraint(equalTo: starSign.bottomAnchor, constant: 16),
            clockIcon.heightAnchor.constraint(equalTo: clockIcon.widthAnchor),
            clockIcon.heightAnchor.constraint(equalTo: starSign.heightAnchor),
            
            // setup duration stackView
            durationStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            durationStackView.topAnchor.constraint(equalTo: genresStackView.bottomAnchor, constant: 16),
            durationStackView.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.2),
            
            // setup poster icon
            posterButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            posterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            posterButton.heightAnchor.constraint(equalTo: posterButton.widthAnchor),
            posterButton.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.05),
        ])
    }
    
    // MARK: - Configuration
    
    private func configurePosterButton() {
        posterButton.addAction(UIAction { [weak self] _ in
            self?.buttonAction()
        }, for: .touchUpInside )
    }
    
    private func buttonAction() {
        guard let movie = tappedMovie else { return }
        posterTap?(movie)
    }
    
    func configurePopularTableCell(with movie: Movie) {
        self.tappedMovie = movie
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)/10 IMDb"
        posterImageView.image = UIImage(named: movie.posterName)
        durationLabel.text = movie.duration
        let count = movie.genres.count
        for i in 0..<count {
            let genreLabel = GenreLabel(text: movie.genres[i])
            genresStackView.addArrangedSubview(genreLabel)
        }
    }
}
