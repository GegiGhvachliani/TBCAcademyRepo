//
//  DetailsPageVC.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

final class DetailsPageVC: UIViewController {
    
    // MARK: - Properties
    private let detailsPageViewModel: DetailViewModel
        
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.scrollsToTop = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let bannerImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SpiderManBanner"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let movieHeaderView: MovieHeaderView = {
        let view = MovieHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let movieInfoView: MovieInfoView = {
        let view = MovieInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let genresStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont(name: "Merriweather-Black", size: ScreenSize.width * 0.05)
        label.textColor = .label
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Peter Parker's secret identity is revealed to the entire world. Desperate for help, Peter turns to Doctor Strange to make the world forget that he is Spider-Man. The spell goes horribly wrong and shatters the multiverse, bringing in villains from alternate realities."
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.037)
        label.textColor = .gray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let castTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont(name: "Merriweather-Black", size: ScreenSize.width * 0.05)
        label.textColor = .label
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let castStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.contentMode = .scaleAspectFit
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    init(viewModel: DetailViewModel) {
        self.detailsPageViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupDetailsPage()
        bindViewModel()
        detailsPageViewModel.loadMovie()
    }
    
    // MARK: - Methods
    
    private func setupDetailsPage() {
        setupMovieHeaderView()
        setupMovieInfoView()
        setupDescriptionView()
        setupCastView()
    }
   
    private func setupMovieHeaderView() {
        view.addSubview(bannerImageButton)
        view.addSubview(movieHeaderView)
        view.addSubview(genresStackView)
        
        NSLayoutConstraint.activate([
            bannerImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerImageButton.topAnchor.constraint(equalTo: view.topAnchor),
            bannerImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerImageButton.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.35),
            
            movieHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieHeaderView.topAnchor.constraint(equalTo: bannerImageButton.bottomAnchor, constant: 0),
            movieHeaderView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.12),
            genresStackView.leadingAnchor.constraint(equalTo: movieHeaderView.leadingAnchor),
            genresStackView.topAnchor.constraint(equalTo: movieHeaderView.bottomAnchor, constant: 0),
        ])
    }
    
    private func setupMovieInfoView() {
        view.addSubview(movieInfoView)
        
        NSLayoutConstraint.activate([
            movieInfoView.topAnchor.constraint(equalTo: genresStackView.bottomAnchor, constant: 16),
            movieInfoView.leadingAnchor.constraint(equalTo: genresStackView.leadingAnchor),
            movieInfoView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.05)
        ])
    }
    
    private func setupDescriptionView() {
        view.addSubview(descriptionTitleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: movieInfoView.leadingAnchor),
            descriptionTitleLabel.topAnchor.constraint(equalTo: movieInfoView.bottomAnchor, constant: 20),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionTitleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCastView() {
        view.addSubview(castTitleLabel)
        view.addSubview(castStackView)
        
        NSLayoutConstraint.activate([
            castTitleLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            castTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            
            castStackView.leadingAnchor.constraint(equalTo: castTitleLabel.leadingAnchor),
            castStackView.topAnchor.constraint(equalTo: castTitleLabel.bottomAnchor, constant: 20),
            castStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func bindViewModel() {
        detailsPageViewModel.onMovieLoaded = { [weak self] in
            self?.configureDetailsPage()
            self?.configureCast()
        }
    }
    
    private func configureCast() {
        for name in detailsPageViewModel.cast {
            
            let actorImageView: UIImageView = {
                let imageView = UIImageView()
                imageView.contentMode = .scaleAspectFit
                imageView.translatesAutoresizingMaskIntoConstraints = false
                return imageView
            }()
            
            let actorNameLabel: UILabel = {
                let label = UILabel()
                label.font = UIFont(name: "Mulish-SemiBold", size: ScreenSize.width * 0.032)
                label.textAlignment = .left
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.textColor = .label
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            let actorStackView: UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                stack.contentMode = .scaleAspectFill
                stack.distribution = .equalCentering
                stack.alignment = .center
                stack.spacing = 5
                stack.translatesAutoresizingMaskIntoConstraints = false
                return stack
            }()
            
            actorImageView.image = UIImage(named: name)
            actorNameLabel.text = name
            
            actorStackView.addArrangedSubview(actorImageView)
            actorStackView.addArrangedSubview(actorNameLabel)
            
            castStackView.addArrangedSubview(actorStackView)
        }
    }
    
    private func goPosterPage() {
        detailsPageViewModel.didTapBanner()
    }
    
    private func configureDetailsPage() {
        bannerImageButton.setImage(UIImage(named: detailsPageViewModel.bannerName), for: .normal)
        
        bannerImageButton.addAction(UIAction { [weak self] _ in
            self?.goPosterPage()
        }, for: .touchUpInside)
        
        descriptionLabel.text = detailsPageViewModel.description
        movieHeaderView.configureMovieHeader(title: detailsPageViewModel.title, rating: detailsPageViewModel.rating)
        movieInfoView.configureMovieInfoView(duration: detailsPageViewModel.duration, language: detailsPageViewModel.language, ageRating: detailsPageViewModel.ageRating)
        
        for genre in detailsPageViewModel.genres {
            let genreLabel = GenreLabel(text: genre)
            genresStackView.addArrangedSubview(genreLabel)
        }
    }
}
