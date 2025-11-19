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

class FlagInfoView: UIView {
    
    // MARK: - Properties
    
    private let flagNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: ScreenSize.width * 0.05, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private let flagContainerView: UIView = {
        let view = UIView()
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    private let flagView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let titleLabel = TitleLabel(text: "About the flag:")
    
    private let infoLabel = FlagInfoLabel(
        text: "The flag of Georgia has a white field with a large centered red cross that extends to the edges and divides the field into four quarters. A small red Bolnur-Katskhuri cross is centered in each quarter."
    )
    
    private let lineView = GrayLine()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        setupFlagHeaderView()
        setupInfoSection()
        setupLineView()
    }
    
    private func setupFlagHeaderView() {
        addSubview(flagNameLabel)
        addSubview(flagContainerView)
        flagContainerView.addSubview(flagView)
        
        // flagName
        flagNameLabel.top(to: self)
        flagNameLabel.leading(to: self)
        flagNameLabel.trailing(to: self)
        flagNameLabel.height(30)
        
        // flagContainerView
        flagContainerView.leading(to: self)
        flagContainerView.trailing(to: self)
        flagContainerView.topToBottom(of: flagNameLabel, offset: 20)
        flagContainerView.height(230)
        
        // flagView
        flagView.edgesToSuperview()
    }
    
    private func setupInfoSection() {
        addSubview(titleLabel)
        addSubview(infoLabel)
        
        // titleLabel
        titleLabel.leading(to: self, offset: 16)
        titleLabel.topToBottom(of: flagContainerView, offset: 20)
        
        // infoLabel
        infoLabel.leading(to: titleLabel)
        infoLabel.topToBottom(of: titleLabel, offset: 16)
        infoLabel.trailing(to: flagContainerView)
    }
    
    private func setupLineView() {
        addSubview(lineView)
        
        lineView.leading(to: flagContainerView, offset: 20)
        lineView.trailing(to: flagContainerView, offset: -20)
        lineView.topToBottom(of: infoLabel, offset: 30)
        lineView.height(1.5)
        lineView.bottom(to: self)

    }
    
    // MARK: - Configure
    
    func configure(name: String, flagImage: String, flagInfo: String) {
        flagNameLabel.text = name
        if let url = URL(string: flagImage) {
            flagView.load(with: url)
        }
        infoLabel.text = flagInfo
    }
}

