//
//
//  BasicInfoSection.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit
import TinyConstraints
import CommonUIComponents

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
        
        titleLabel.leading(to: self, offset: 16)
        titleLabel.topToSuperview()
    }
    
    private func setupButtons() {
        addSubview(openStreetMapsButton)
        addSubview(googleMapsButton)
        
        openStreetMapsButton.leadingToSuperview(offset: 80)
        openStreetMapsButton.topToBottom(of: titleLabel, offset: 20)
        openStreetMapsButton.width(ScreenSize.width * 0.16)
        openStreetMapsButton.aspectRatio(1)
        
        googleMapsButton.leadingToTrailing(of: openStreetMapsButton, offset: 100)
        googleMapsButton.top(to: openStreetMapsButton)
        googleMapsButton.width(to: openStreetMapsButton)
        googleMapsButton.aspectRatio(1)
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
