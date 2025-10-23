//
//  CountryFlag.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 23.10.25.
//

import UIKit

class CountryFlagView: UIView {
    private var nameLabel: UILabel = UILabel()
    private var containerForFlag: UIView = UIView()
    private var FlagImage: UIImageView = UIImageView()
    private var aboutLabel: UILabel = UILabel()
    private var infoLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupNameLabel()
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "georgia"
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nameLabel.textColor = .label
        nameLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: leftAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
}

#Preview {
    CountryFlagView()
}
