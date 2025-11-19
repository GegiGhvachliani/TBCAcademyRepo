//
//  BackgroundImage.swift
//  Assignment19
//
//  Created by Gegi Ghvachliani on 18.10.25.
//

import UIKit

class BackgroundImage: UIView {
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "Background")
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupBackgroundImage()
    }
    
    private func setupBackgroundImage() {
        addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    
    
}
