//
//  LoginView.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class LoginView: UIView {
    // MARK: Stored Properties
    private let usernameLabel: UILabel = UILabel.LoginLabel(with: "  Username")
    private let passwordLabel: UILabel = UILabel.LoginLabel(with: "  Password")
    private let confirmPasswordLabel: UILabel = UILabel.LoginLabel(with: "  Confirm Password")
    
    let usernameTextField = UITextField.loginTextField(with: "Enter username")
    let passwordTextField = UITextField.loginTextField(with: "Password")
    let confirmPasswordTextField = UITextField.loginTextField(with: "Password")
    
    private var usernameVStack: UIStackView = UIStackView()
    private var passwordVStack: UIStackView = UIStackView()
    private var confirmPasswordVStack: UIStackView = UIStackView()
    
    private let mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .vertical
        stack.spacing = ScreenSize.width * (6 / 320)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    // MARK: Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        addSubview(mainVStack)
        mainVStack.addArrangedSubview(usernameVStack)
        mainVStack.addArrangedSubview(passwordVStack)
        mainVStack.addArrangedSubview(confirmPasswordVStack)
        
        setupLoginStacks()
        setupConstraints()
        
    }
    
    private func setupLoginStacks() {
        configure(usernameVStack, with: usernameLabel, and: usernameTextField)
        configure(passwordVStack, with: passwordLabel, and: passwordTextField)
        configure(confirmPasswordVStack, with: confirmPasswordLabel, and: confirmPasswordTextField)
    }
    
    private func configure(_ stack: UIStackView, with label: UILabel, and textField: UITextField) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(textField)
        
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // mainStack
            mainVStack.topAnchor.constraint(equalTo: topAnchor),
            mainVStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainVStack.leftAnchor.constraint(equalTo: leftAnchor),
            mainVStack.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}
