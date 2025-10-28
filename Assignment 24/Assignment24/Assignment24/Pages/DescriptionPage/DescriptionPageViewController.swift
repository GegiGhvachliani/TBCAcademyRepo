//
//  DescriptionPageViewController.swift
//  Assignment24
//
//  Created by Gegi Ghvachliani on 27.10.25.
//

import UIKit

class DescriptionPageViewController: UIViewController {
    // MARK: Properties
    private var viewModel: DescriptionPageViewModel
    
    private let titleLabel = UILabel.createTitleLabelWith(title: "Details")
    
    private let newsImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = ScreenSize.height * 0.02
        image.clipsToBounds = true
        
        return image
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        
        return label
    }()
    private let infoLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    private lazy var openLinkButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "უფრო ვრცლად"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.background.image = UIImage(named: "BigBrotherIsWatchingYou")
        config.background.imageContentMode = .scaleAspectFill
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let action = UIAction { [weak self] _ in
            self?.viewModel.openLink()
        }
        
        button.addAction(action, for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Initialization
    init(viewModel: DescriptionPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    // MARK: Methods
    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(newsImage)
        view.addSubview(timeLabel)
        view.addSubview(infoLabel)
        view.addSubview(openLinkButton)
        
        configInfos()
        setupConstraints()
    }
    
    private func setupConstraints() {
        //Fimga-ში მოცემული დიზაინის ეკრანის ზომაა 375/812. მათ ვიყენებ გამყოფებად პროპორციის დასაცავად.
        // ყველა წილადი არის ფიგმაში მოცემული კონკრეტული view-ის განზომილების შეფარდება ამ ზომებთან.
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * 0.08),
            
            // newsImage
            newsImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            newsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.88),
            newsImage.heightAnchor.constraint(equalTo: newsImage.widthAnchor, multiplier: 0.57),
            
            // timeLabel
            timeLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: ScreenSize.height * 0.015),
            timeLabel.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor),
            
            // infoLabel
            infoLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: ScreenSize.height * 0.0075),
            infoLabel.widthAnchor.constraint(equalTo: newsImage.widthAnchor),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // linkButton
            openLinkButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: ScreenSize.height * 0.06),
            openLinkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openLinkButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            openLinkButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func configInfos() {
        infoLabel.text = viewModel.newsInfo
        timeLabel.text = viewModel.newsTime
        
        if let url = URL(string: viewModel.newsImage) {
            newsImage.load(with: url)
        }
    }
}
