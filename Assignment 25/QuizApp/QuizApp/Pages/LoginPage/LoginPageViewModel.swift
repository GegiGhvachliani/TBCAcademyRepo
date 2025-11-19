//
//  LoginPageViewModel.swift
//  QuizApp
//
//  Created by Gegi Ghvachliani on 29.10.25.
//

import Foundation
import Security
 
class LoginPageViewModel {
    
    private let passwordKey = "someKey"
    
    func isUserLoggedIn() -> Bool {
        getPassword() != nil
    }
    
    func save(password: String) {
        let data = password.data(using: .utf8)!
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: passwordKey,
            kSecValueData as String: data
        ]
                
        SecItemAdd(query as CFDictionary, nil)
    }
    
    func getPassword() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: passwordKey,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        
        guard let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func erasePassword() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: passwordKey
        ]
        
        SecItemDelete(query as CFDictionary)
    }
}
