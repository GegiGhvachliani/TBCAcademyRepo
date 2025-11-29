//
//  ScreenSize.swift
//  MovieMan
//
//  Created by Gegi Ghvachliani on 29.11.25.
//

import UIKit

class GenreLabel: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Mulish-SemiBold", size: ScreenSize.width * 0.0235)
        label.textAlignment = .center
        label.textColor = UIColor(named: "lightPurple")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(text: String) {
        super.init(frame: .zero)
        label.text = text.uppercased()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        addSubview(label)
        
        backgroundColor = UIColor(named: "genreFill")
        layer.cornerRadius = 11
        clipsToBounds = true
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}

#Preview {
    GenreLabel(text: "Horror")
}
