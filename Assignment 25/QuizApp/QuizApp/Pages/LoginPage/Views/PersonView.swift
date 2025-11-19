//
//  PersonView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class PersonView: UIView {
    private let personBackgourndView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = ScreenSize.width * 0.17
        view.clipsToBounds = true
        
        return view
    }()
    
    private let personSymbolImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        image.contentMode = .scaleAspectFit
        image.tintColor = .label
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        addSubview(personBackgourndView)
        personBackgourndView.addSubview(personSymbolImage)
        
        NSLayoutConstraint.activate([
        // personBackgroundView
        personBackgourndView.topAnchor.constraint(equalTo: topAnchor),
        personBackgourndView.bottomAnchor.constraint(equalTo: bottomAnchor),
        personBackgourndView.leftAnchor.constraint(equalTo: leftAnchor),
        personBackgourndView.rightAnchor.constraint(equalTo: rightAnchor),
        
        // personSymbolImage
        personSymbolImage.centerXAnchor.constraint(equalTo: personBackgourndView.centerXAnchor, constant: ScreenSize.width * (-0.009)),
        personSymbolImage.centerYAnchor.constraint(equalTo: personBackgourndView.centerYAnchor),
        personSymbolImage.heightAnchor.constraint(equalTo: personBackgourndView.heightAnchor, multiplier: 0.6),
        personSymbolImage.widthAnchor.constraint(equalTo: personSymbolImage.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

