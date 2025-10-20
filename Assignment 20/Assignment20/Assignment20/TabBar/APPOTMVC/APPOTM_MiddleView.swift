//
//  APPOTM_MiddleView.swift
//  Assignment20
//
//  Created by Gegi Ghvachliani on 20.10.25.
//

import UIKit

final class APPOTM_MiddleView: UIView {
    private var iconsHStack: UIStackView = UIStackView()
    
    private var featureIcon: UIImageView = UIImageView()
    private var categoryIcon: UIImageView = UIImageView()
    private var developerIcon: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupHStack()
        
        setupFeatureIcon()
        setupCategoryIcon()
        setupDeveloperIcon()
    }
    
    private func setupHStack() {
        addSubview(iconsHStack)
        iconsHStack.translatesAutoresizingMaskIntoConstraints = false
        
        iconsHStack.axis = .horizontal
        iconsHStack.alignment = .fill
        iconsHStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            iconsHStack.topAnchor.constraint(equalTo: topAnchor),
            iconsHStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconsHStack.leftAnchor.constraint(equalTo: leftAnchor),
            iconsHStack.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private func setupFeatureIcon() {
        iconsHStack.addArrangedSubview(featureIcon)
        featureIcon.translatesAutoresizingMaskIntoConstraints = false
        
        featureIcon.tintColor = .gray
        featureIcon.image = UIImage(named: "feature")
        featureIcon.contentMode = .scaleAspectFit
    }
    
    private func setupCategoryIcon() {
        iconsHStack.addArrangedSubview(categoryIcon)
        categoryIcon.translatesAutoresizingMaskIntoConstraints = false
        
        categoryIcon.tintColor = .gray
        categoryIcon.contentMode = .scaleAspectFit
        categoryIcon.image = UIImage(named: "category")
    }
    
    private func setupDeveloperIcon() {
        iconsHStack.addArrangedSubview(developerIcon)
        developerIcon.translatesAutoresizingMaskIntoConstraints = false
        
        developerIcon.tintColor = .gray
        developerIcon.contentMode = .scaleAspectFit
        developerIcon.image = UIImage(named: "developer")
    }
    
}
