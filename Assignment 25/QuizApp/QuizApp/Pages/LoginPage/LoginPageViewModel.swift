//
//  LoginPageViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

class LoginPageViewModel {
    var login: (() -> Void)?
    
    func login(username: String, password: String, confirmPassword: String) {
        guard !username.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else { return }
        
        guard password == confirmPassword else { return }
        
        login?()
    }
}
