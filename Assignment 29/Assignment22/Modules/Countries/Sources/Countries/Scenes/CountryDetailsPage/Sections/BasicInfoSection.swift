//
//  BasicInfoSection.swift
//  Assignment22
//
//  Created by Gegi Ghvachliani on 26.10.25.
//

import UIKit
import TinyConstraints
import CommonUIComponents

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
        
        titleLabel.leading(to: self, offset: 16)
        titleLabel.topToSuperview()
        titleLabel.height(20)
    }
    
    private func setupLeftSideSection() {
        addSubview(nativeNameTitle)
        addSubview(spellingTitle)
        addSubview(capitalTitle)
        addSubview(currencyTitle)
        
        nativeNameTitle.leading(to: titleLabel)
        nativeNameTitle.topToBottom(of: titleLabel, offset: 16)
        
        spellingTitle.leading(to: nativeNameTitle)
        spellingTitle.topToBottom(of: nativeNameTitle, offset: 16)
        
        capitalTitle.leading(to: spellingTitle)
        capitalTitle.topToBottom(of: spellingTitle, offset: 16)
        
        currencyTitle.leading(to: capitalTitle)
        currencyTitle.topToBottom(of: capitalTitle, offset: 16)
    }
    
    private func setupRightSide() {
        addSubview(nativeNameLabel)
        addSubview(spellingLabel)
        addSubview(capitalLabel)
        addSubview(currencyLabel)
        
        nativeNameLabel.trailing(to: self, offset: -16)
        nativeNameLabel.top(to: nativeNameTitle)
        
        spellingLabel.trailing(to: nativeNameLabel)
        spellingLabel.top(to: spellingTitle)
        
        capitalLabel.trailing(to: spellingLabel)
        capitalLabel.top(to: capitalTitle)
        
        currencyLabel.trailing(to: capitalLabel)
        currencyLabel.top(to: currencyTitle)
    }
    
    private func setupLineView() {
        addSubview(lineView)
        
        lineView.leading(to: currencyTitle, offset: 10)
        lineView.trailing(to: currencyLabel, offset: -16)
        lineView.topToBottom(of: currencyLabel, offset: 25)
        lineView.height(1.5)
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


