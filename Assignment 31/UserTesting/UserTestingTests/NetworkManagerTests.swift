//
//  NetworkManagerTests.swift
//  UserTesting
//
//  Created by Gegi Ghvachliani on 13.11.25.
//

import XCTest
@testable import UserTesting

final class NetworkManagerTests: XCTestCase {
    var networkManager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testFetchUsers() {
        var users: [User]?
        
        let expectation = XCTestExpectation(description: "fetch users")
        
        networkManager.fetchUsers(withLimit: 1) { user in
            users = user
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertNotNil(users)
        XCTAssertEqual(users?.count, 1)
    }
    
    func testUserValidation() {
        var users: [User]?
        
        let expectation = XCTestExpectation(description: "user infos are vaild")
        
        networkManager.fetchUsers(withLimit: 1) { user in
            users = user
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
        
        let user = users!.first
    
        XCTAssertFalse(user!.name.first.isEmpty)
        XCTAssertFalse(user!.name.last.isEmpty)
        XCTAssertFalse(user!.name.title.isEmpty)
        XCTAssertFalse(user!.email.isEmpty)
        XCTAssertFalse(user!.phone.isEmpty)
        XCTAssertFalse(user!.cell.isEmpty)
        XCTAssertFalse(user!.picture.large.isEmpty)
        XCTAssertFalse(user!.picture.medium.isEmpty)
        XCTAssertFalse(user!.picture.thumbnail.isEmpty)
        XCTAssertFalse(user!.gender.isEmpty)
    }
}
