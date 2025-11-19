//
//  PosterPageVC.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class PosterPageVC: UIViewController {
    
    // MARK: - Properties
    
    private let bannerName: String
    private let movieTitle: String
        
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "spiderManB")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spiderman: No Way Home"
        label.font = UIFont(name: "Merriweather-Black", size: ScreenSize.width * 0.05)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(bannerName: String, title: String) {
        self.bannerName = bannerName
        self.movieTitle = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        setupPosterPage()
        configurePosterPage()
    }
    
    // MARK: - Setup
    
    private func setupPosterPage() {
        view.addSubview(posterImageView)
        posterImageView.addSubview(movieTitleLabel)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieTitleLabel.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            movieTitleLabel.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.8),
            movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70)
        ])
    }
    
    // MARK: - Configure
    
    func configurePosterPage() {
        movieTitleLabel.text = movieTitle
        posterImageView.image = UIImage(named: bannerName)
    }
}
