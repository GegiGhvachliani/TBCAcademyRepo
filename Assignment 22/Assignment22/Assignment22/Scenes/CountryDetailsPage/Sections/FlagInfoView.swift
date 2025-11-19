//
//
//  BasicInfoSection.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//
import UIKit

class FlagInfoView: UIView {
    
    // MARK: - Properties
    
    private let flagNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: ScreenSize.width * 0.05, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let flagContainerView: UIView = {
        let view = UIView()
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let flagView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel = TitleLabel(text: "About the flag:")
    
    private let infoLabel = FlagInfoLabel(
        text: "The flag of Georgia has a white field with a large centered red cross that extends to the edges and divides the field into four quarters. A small red Bolnur-Katskhuri cross is centered in each quarter."
    )
    
    private let lineView = GrayLine()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        setupFlagHeaderView()
        setupInfoSection()
        setupLineView()
    }
    
    private func setupFlagHeaderView() {
        addSubview(flagNameLabel)
        addSubview(flagContainerView)
        flagContainerView.addSubview(flagView)
        
        NSLayoutConstraint.activate([
            // setup flagName
            flagNameLabel.topAnchor.constraint(equalTo: topAnchor),
            flagNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            flagNameLabel.heightAnchor.constraint(equalToConstant: 30),
            flagNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            // setup container
            flagContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            flagContainerView.topAnchor.constraint(equalTo: flagNameLabel.bottomAnchor, constant: 20),
            flagContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            flagContainerView.heightAnchor.constraint(equalToConstant: 230),
            
            // setup flagView
            flagView.topAnchor.constraint(equalTo: flagContainerView.topAnchor),
            flagView.leadingAnchor.constraint(equalTo: flagContainerView.leadingAnchor),
            flagView.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor),
            flagView.bottomAnchor.constraint(equalTo: flagContainerView.bottomAnchor)
        ])
    }
    
    private func setupInfoSection() {
        addSubview(titleLabel)
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            // setup title
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: flagContainerView.bottomAnchor, constant: 20),
            
            // setup info
            infoLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor)
        ])
    }
    
    private func setupLineView() {
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: flagContainerView.leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor, constant: -20),
            lineView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            lineView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
    
    // MARK: - Configure
    
    func configure(name: String, flagImage: String, flagInfo: String) {
        flagNameLabel.text = name
        if let url = URL(string: flagImage) {
            flagView.load(with: url)
        }
        infoLabel.text = flagInfo
    }
}

