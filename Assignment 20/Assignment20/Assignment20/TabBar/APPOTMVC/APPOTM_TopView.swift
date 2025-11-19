//
//  APPOTM_TopView.swift
//  Assignment20
//
//  Created by Gegi Ghvachliani on 20.10.25.
//

import UIKit

final class APPOTM_TopView: UIView {
    private var TBCiconImage: UIImageView = UIImageView()
    
    private var labelsVStack: UIStackView = UIStackView()
    private var TBCtitleLabel: UILabel = UILabel()
    private var TBCsubtitleLabel: UILabel = UILabel()
    
    private var TBCgetAppButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTBCiconImage()

        setupTBCtitleLabel()
        setupTBCsubtitleLabel()
        setupTBCgetAppButton()
    }
    
    private func setupTBCiconImage() {
        addSubview(TBCiconImage)
        TBCiconImage.translatesAutoresizingMaskIntoConstraints = false
        
        TBCiconImage.image = UIImage(named: "TBClogo")
        TBCiconImage.layer.cornerRadius = UIScreen.main.bounds.width * (30 / 393)
        TBCiconImage.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            TBCiconImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            TBCiconImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            TBCiconImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 120 / 393),
            TBCiconImage.heightAnchor.constraint(equalTo: TBCiconImage.widthAnchor)
        ])
    }
    

    
    private func setupTBCtitleLabel() {
        addSubview(TBCtitleLabel)
        TBCtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        TBCtitleLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        TBCtitleLabel.text = "TBC"
        TBCtitleLabel.textColor = .label
        TBCtitleLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            TBCtitleLabel.leftAnchor.constraint(equalTo: TBCiconImage.rightAnchor, constant: 15),
            TBCtitleLabel.topAnchor.constraint(equalTo: TBCiconImage.topAnchor, constant: 0),
            TBCtitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 70 / 393),
            TBCtitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 30 / 120)
        ])
    }
    
    private func setupTBCsubtitleLabel() {
        addSubview(TBCsubtitleLabel)
        TBCsubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        TBCsubtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        TBCsubtitleLabel.text = "Banking Aplication"
        TBCsubtitleLabel.textColor = .systemGray
        TBCsubtitleLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            TBCsubtitleLabel.leftAnchor.constraint(equalTo: TBCiconImage.rightAnchor, constant: 15),
            TBCsubtitleLabel.topAnchor.constraint(equalTo: TBCtitleLabel.bottomAnchor, constant: -5),
            TBCsubtitleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 140 / 393),
            TBCsubtitleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 25 / 120)
        ])
    }
    
    private func setupTBCgetAppButton() {
        addSubview(TBCgetAppButton)
        TBCgetAppButton.translatesAutoresizingMaskIntoConstraints = false
        
        TBCgetAppButton.setTitle("Get", for: .normal)
        TBCgetAppButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        TBCgetAppButton.titleLabel?.textColor = .white
        TBCgetAppButton.titleLabel?.textAlignment = .center
        TBCgetAppButton.layer.cornerRadius = UIScreen.main.bounds.height * (16 / 852)
        TBCgetAppButton.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            TBCgetAppButton.leftAnchor.constraint(equalTo: TBCsubtitleLabel.leftAnchor),
            TBCgetAppButton.bottomAnchor.constraint(equalTo: TBCiconImage.bottomAnchor),
            TBCgetAppButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 71 / 393),
            TBCgetAppButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 30 / 120)
        ])
    }

}

#Preview {
    APPOTMVC()
}
