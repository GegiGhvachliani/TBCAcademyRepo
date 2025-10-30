//
//  LoginPageViewController.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import UIKit

class LoginPageViewController: UIViewController {
    // MARK: Properties
    private let viewModel: LoginPageViewModel
    
    private let personView: PersonView = PersonView()
    private let loginView: LoginView = LoginView()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .button
        button.layer.cornerRadius = ScreenSize.width * 0.0375
        button.clipsToBounds = true
        
        button.addAction(UIAction { [weak self] _ in
            self?.handleLogin()
            self?.navigate()
        }, for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Initializaations
    init(viewModel: LoginPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupUI()
    }
    
    // MARK: Methods
    private func setupUI() {
        view.addSubview(personView)
        view.addSubview(loginView)
        view.addSubview(loginButton)
        
        personView.translatesAutoresizingMaskIntoConstraints = false
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // personView
            personView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            personView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.34),
            personView.heightAnchor.constraint(equalTo: personView.widthAnchor, multiplier: 0.97),
            
            // loginView
            loginView.topAnchor.constraint(equalTo: personView.bottomAnchor, constant: 30),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ScreenSize.width * (0.0625)),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ScreenSize.width * (-0.0625)),
            loginView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            // loginButton
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: ScreenSize.height * (-0.066)),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.066)
        ])
        
    }
    
    private func handleLogin() {
        let username = loginView.usernameTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        let confirmPassword = loginView.confirmPasswordTextField.text ?? ""
        
        guard password == confirmPassword else {
            return
        }
        
        guard password.isEmpty != true, confirmPassword.isEmpty != true, username.isEmpty != true else {
            return
        }
        
        viewModel.save(password: password)
    }
    
    private func navigate() {
        let nextVC = QuizPageViewController(viewModel: QuizPageViewModel())
        navigationController?.pushViewController(nextVC, animated: true)
    }
}


