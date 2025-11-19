//
//  TopView.swift
//  Assignment20
//
//  Created by Gegi Ghvachliani on 20.10.25.
//

import UIKit

final class TopView: UIView {
    private var NewsLabel: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(NewsLabel)
        NewsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NewsLabel.text = "News"
        NewsLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        NewsLabel.textColor = .black
        NewsLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            NewsLabel.topAnchor.constraint(equalTo: topAnchor),
            NewsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            NewsLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1),
            NewsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
        ])
    }
}
