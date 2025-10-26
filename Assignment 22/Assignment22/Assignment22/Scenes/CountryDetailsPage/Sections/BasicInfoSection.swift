//
//  BasicInfoSection.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit

class BasicInfoSection: UIView {
    
    // MARK: - Properties
    
    private let titleLabel = InfoLabel(text: "Basic information")
    
    private let nativeNameTitle = InfoLabel(text: "Native name")
    
    private let nativeNameLabel = InfoLabel(text: "")
    
    private let spellingTitle = InfoLabel(text: "Spelling")
    
    private let spellingLabel = InfoLabel(text: "")
    
    private let capitalTitle = InfoLabel(text: "Capital:")
    
    private let capitalLabel = InfoLabel(text: "")
    
    private let currencyTitle = InfoLabel(text: "Currency")
    
    private let currencyLabel = InfoLabel(text: "")
    
    private let lineView = GrayLine()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBasicInfoSection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupBasicInfoSection() {
        setupTitleLabel()
        setupLeftSideSection()
        setupRightSide()
        setupLineView()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupLeftSideSection() {
        addSubview(nativeNameTitle)
        addSubview(spellingTitle)
        addSubview(capitalTitle)
        addSubview(currencyTitle)
        
        NSLayoutConstraint.activate([
            nativeNameTitle.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nativeNameTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            spellingTitle.leadingAnchor.constraint(equalTo: nativeNameTitle.leadingAnchor),
            spellingTitle.topAnchor.constraint(equalTo: nativeNameTitle.bottomAnchor, constant: 16),
            
            capitalTitle.leadingAnchor.constraint(equalTo: spellingTitle.leadingAnchor),
            capitalTitle.topAnchor.constraint(equalTo: spellingTitle.bottomAnchor, constant: 16),
            
            currencyTitle.leadingAnchor.constraint(equalTo: capitalTitle.leadingAnchor),
            currencyTitle.topAnchor.constraint(equalTo: capitalTitle.bottomAnchor, constant: 16),
        ])
    }
    
    private func setupRightSide() {
        addSubview(nativeNameLabel)
        addSubview(spellingLabel)
        addSubview(capitalLabel)
        addSubview(currencyLabel)
        
        NSLayoutConstraint.activate([
            nativeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nativeNameLabel.topAnchor.constraint(equalTo: nativeNameTitle.topAnchor),
            
            spellingLabel.trailingAnchor.constraint(equalTo: nativeNameLabel.trailingAnchor),
            spellingLabel.topAnchor.constraint(equalTo: spellingTitle.topAnchor),
            
            capitalLabel.trailingAnchor.constraint(equalTo: spellingLabel.trailingAnchor),
            capitalLabel.topAnchor.constraint(equalTo: capitalTitle.topAnchor),
            
            currencyLabel.trailingAnchor.constraint(equalTo: capitalLabel.trailingAnchor),
            currencyLabel.topAnchor.constraint(equalTo: currencyTitle.topAnchor)
        ])
    }
    
    private func setupLineView() {
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: currencyTitle.leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: currencyLabel.trailingAnchor, constant: -16),
            lineView.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 25),
            lineView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
    
    // MARK: - Configure
    
    func configure(nativeName: String, spelling: String, capital: String, currencyName: String, currencySymbol: String) {
        nativeNameLabel.text = nativeName
        spellingLabel.text = spelling
        capitalLabel.text = capital
        currencyLabel.text = "\(currencyName), \(currencySymbol)"
    }
}


#Preview {
    BasicInfoSection()
}


