//
//  InfoPageViewController.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//


import UIKit

class InfoPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let infoPageViewModel: InfoPageViewModel
    
    private let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let flagInfoView: FlagInfoView = {
        let view = FlagInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let basicInfoSection: BasicInfoSection = {
        let view = BasicInfoSection()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let linksSection: LinksSection = {
        let view = LinksSection()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "chevron.left")
        button.style = .plain
        button.tintColor = .label
        return button
    }()
    
    // MARK: - Initialization
    
    init(infoPageViewModel: InfoPageViewModel) {
        self.infoPageViewModel = infoPageViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupInfoPageVC()
        configure()
        backButton.target = self
        backButton.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem = backButton
    }

    // MARK: - Setup
    
    private func setupInfoPageVC() {
        setupScroll()
        setupContentView()
        setupFlagInfoView()
        setupBasicInfoView()
        setupLinksView()
    }
    
    private func setupScroll() {
        view.addSubview(scroll)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        scroll.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scroll.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scroll.widthAnchor)
        ])
    }
    
    private func setupFlagInfoView() {
        contentView.addSubview(flagInfoView)
        
        NSLayoutConstraint.activate([
            flagInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            flagInfoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            flagInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            flagInfoView.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.5)
        ])
    }
    
    private func setupBasicInfoView() {
        contentView.addSubview(basicInfoSection)
        
        NSLayoutConstraint.activate([
            basicInfoSection.leadingAnchor.constraint(equalTo: flagInfoView.leadingAnchor),
            basicInfoSection.topAnchor.constraint(equalTo: flagInfoView.bottomAnchor, constant: 20),
            basicInfoSection.trailingAnchor.constraint(equalTo: flagInfoView.trailingAnchor),
            basicInfoSection.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.2)
        ])
    }
    
    private func setupLinksView() {
        contentView.addSubview(linksSection)
        
        NSLayoutConstraint.activate([
            linksSection.leadingAnchor.constraint(equalTo: basicInfoSection.leadingAnchor),
            linksSection.topAnchor.constraint(equalTo: basicInfoSection.bottomAnchor, constant: 20),
            linksSection.trailingAnchor.constraint(equalTo: basicInfoSection.trailingAnchor),
            linksSection.heightAnchor.constraint(equalToConstant: ScreenSize.height * 0.16),
            linksSection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
        ])
    }
    
    // MARK: - Functions
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Configure
    
    func configure() {
        flagInfoView.configure(
                name: infoPageViewModel.name,
                flagImage: infoPageViewModel.flagImage,
                flagInfo: infoPageViewModel.flagInfo
            )
        
        basicInfoSection.configure(
            nativeName: infoPageViewModel.nativeName,
            spelling: infoPageViewModel.spelling,
            capital: infoPageViewModel.capital,
            currencyName: infoPageViewModel.currencyName,
            currencySymbol: infoPageViewModel.currencySymbol
        )
        
        linksSection.configure(
            openStreetsMaps: infoPageViewModel.openStreetMaps,
            googleMaps: infoPageViewModel.googleMaps
        )
    }
}