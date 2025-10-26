//
//
//  BasicInfoSection.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class LinksSection: UIView {
    
    // MARK: - Properties
    
    private let titleLabel = TitleLabel(text: "Useful links:")
    private let openStreetMapsButton = UIButton.customButton(imageName: "streets")
    private let googleMapsButton = UIButton.customButton(imageName: "google")
    
    private var openStreetMapsURL: String = ""
    private var googleMapsURL: String = ""
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLinksSection()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupLinksSection() {
        setupTitleLabel()
        setupButtons()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupButtons() {
        addSubview(openStreetMapsButton)
        addSubview(googleMapsButton)
        
        NSLayoutConstraint.activate([
            openStreetMapsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            openStreetMapsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            openStreetMapsButton.heightAnchor.constraint(equalTo: openStreetMapsButton.widthAnchor),
            openStreetMapsButton.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.16),
            
            googleMapsButton.leadingAnchor.constraint(equalTo: openStreetMapsButton.trailingAnchor, constant: 100),
            googleMapsButton.topAnchor.constraint(equalTo: openStreetMapsButton.topAnchor),
            googleMapsButton.heightAnchor.constraint(equalTo: googleMapsButton.widthAnchor),
            googleMapsButton.widthAnchor.constraint(equalTo: openStreetMapsButton.widthAnchor)
        ])
    }
    
    // MARK: - Functions
    
    private func addActions() {
        openStreetMapsButton.addAction(UIAction { [weak self] _ in
            self?.openStreetMaps()
        }, for: .touchUpInside)
        
        googleMapsButton.addAction(UIAction { [weak self] _ in
            self?.openGoogleMaps()
        }, for: .touchUpInside)
    }
    
    private func openStreetMaps() {
        guard let url = URL(string: openStreetMapsURL ) else { return }
        UIApplication.shared.open(url)
    }
    
    private func openGoogleMaps() {
        guard let url = URL(string: googleMapsURL) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Configure
    
    func configure(openStreetsMaps: String, googleMaps: String) {
        openStreetMapsURL = openStreetsMaps
        googleMapsURL = googleMaps
    }
}

#Preview {
    LinksSection()
}
