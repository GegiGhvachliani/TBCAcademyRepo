//
//  InfoPageViewController.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//


import UIKit
import TinyConstraints
import CommonUIComponents

class InfoPageViewController: UIViewController {
    
    // MARK: - Properties
    
    private let infoPageViewModel: InfoPageViewModel
    
    private let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let flagInfoView: FlagInfoView = {
        let view = FlagInfoView()
        return view
    }()
    
    private let basicInfoSection: BasicInfoSection = {
        let view = BasicInfoSection()
        return view
    }()
    
    private let linksSection: LinksSection = {
        let view = LinksSection()
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
        scroll.edgesToSuperview()
    }
    
    private func setupContentView() {
        scroll.addSubview(contentView)
        
        contentView.edgesToSuperview()
        contentView.width(to: scroll)
    }
    
    private func setupFlagInfoView() {
        contentView.addSubview(flagInfoView)
        
        flagInfoView.leading(to: contentView, offset: 16)
        flagInfoView.trailing(to: contentView, offset: -16)
        flagInfoView.top(to: contentView)
        // flagInfoView.height(ScreenSize.height * 0.5)
    }
    
    private func setupBasicInfoView() {
        contentView.addSubview(basicInfoSection)
        
        basicInfoSection.leading(to: flagInfoView)
        basicInfoSection.topToBottom(of: flagInfoView, offset: 20)
        basicInfoSection.trailing(to: flagInfoView)
        basicInfoSection.height(ScreenSize.height * 0.2)
    }
    
    private func setupLinksView() {
        contentView.addSubview(linksSection)
        
        linksSection.leading(to: basicInfoSection)
        linksSection.trailing(to: basicInfoSection)
        linksSection.topToBottom(of: basicInfoSection, offset: 20)
        linksSection.height(ScreenSize.height * 0.16)
        linksSection.bottom(to: contentView, offset: -100)
        
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
