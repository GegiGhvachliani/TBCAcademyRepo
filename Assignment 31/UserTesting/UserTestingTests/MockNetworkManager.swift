//
//  MockAPIService.swift
//  UserTesting
//
//  Created by Gegi Ghvachliani on 13.11.25.
//
import Foundation
enum MockNetworkingErrors: Error {
    case noData
}
import XCTest
@testable import UserTesting
class MockNetworkManager: NetworkManagerProtocol {
    var fetchedUsers: [User]?
    var error: Error?
    
    
    
    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([UserTesting.User]) -> Void) {
        
        do {
            guard let jsonData = User.jsonMock.data(using: .utf8) else {
                throw MockNetworkingErrors.noData
            }
            
            let userList = try JSONDecoder().decode(UserList.self, from: jsonData)
            
            fetchedUsers = userList.results
            completionHandler(fetchedUsers ?? [])
            
            
        } catch {
            XCTFail("Failed to setup mock data: \(error.localizedDescription)")
        }
        
    }
}

