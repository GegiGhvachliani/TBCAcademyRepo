//
//  MovieInfoView.swift
//  Assignment21
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class MovieInfoView: UIView {
    
    // MARK: - Properties
    
    private let movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 60
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let durationStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let languageStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ratingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let durationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Length"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Language"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "2h 28m"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "English"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "PG-13"
        label.font = UIFont(name: "Mulish-Regular", size: ScreenSize.width * 0.033)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInnerStacks()
        setupMovieInfoStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupInnerStacks() {
        // setup durationStack
        addSubview(durationStack)
        durationStack.addArrangedSubview(durationTitleLabel)
        durationStack.addArrangedSubview(durationLabel)
        
        // setup languageStack
        addSubview(languageStack)
        languageStack.addArrangedSubview(languageTitleLabel)
        languageStack.addArrangedSubview(languageLabel)
        
        // setup ratingStack
        addSubview(ratingStack)
        ratingStack.addArrangedSubview(ratingTitleLabel)
        ratingStack.addArrangedSubview(ratingLabel)
    }
    
    private func setupMovieInfoStack() {
        addSubview(movieInfoStackView)
        
        movieInfoStackView.addArrangedSubview(durationStack)
        movieInfoStackView.addArrangedSubview(languageStack)
        movieInfoStackView.addArrangedSubview(ratingStack)
        
        NSLayoutConstraint.activate([
            movieInfoStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieInfoStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieInfoStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Configure
    
    func configureMovieInfoView(duration: String, language: String, ageRating: String) {
        durationLabel.text = duration
        languageLabel.text = language
        ratingLabel.text = ageRating
    }
}

#Preview {
    MovieInfoView()
}
