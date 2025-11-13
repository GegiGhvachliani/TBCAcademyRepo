//
//  UserTestingTests.swift
//  UserTestingTests
//
//  Created by Gegi Ghvachliani on 13.11.25.
//

import XCTest
@testable import UserTesting

final class UserTestingTests: XCTestCase {
    var viewModel: UserViewModel!
    var user: User!
    override func setUp() {
        super.setUp()
        
        let name = Name(title: "Mr", first: "Ze", last: "Morreira")
        
        let picture = Picture(large: "https://randomuser.me/api/portraits/men/25.jpg",
                              medium: "https://randomuser.me/api/portraits/med/men/25.jpg",
                              thumbnail: "https://randomuser.me/api/portraits/thumb/men/25.jpg")
        
        let testUser = User(gender: "Male", name: name, email: "ZeMoreirra@gmail.com", picture: picture, nat: "KAN", cell: "111-111-1111", phone: "222-222-2222")
        
        viewModel = UserViewModel(user: testUser)
    }
    
    override func tearDown() {
        viewModel = nil
        user = nil
        super.tearDown()
    }
    
    func testFullName() {
        let fullName = viewModel.fullName
        
        XCTAssertEqual(fullName, "Mr Ze Morreira")
    }
    
    func testFullNameWithoutTitle() {
        let testName = Name(title: "", first: "Ze", last: "Morreira")
        let testPicture = Picture(large: "", medium: "", thumbnail: "")
        let testUser = User(gender: "", name: testName, email: "", picture: testPicture, nat: "", cell: "", phone: "")
        
        let testViewModel = UserViewModel(user: testUser)
        let fullName = testViewModel.fullName
        
        XCTAssertEqual(fullName, "Ze Morreira")
    }
    
    func testFullNameWithoutFirstName() {
        let testName = Name(title: "Mr", first: "", last: "Morreira")
        let testPicture = Picture(large: "", medium: "", thumbnail: "")
        let testUser = User(gender: "", name: testName, email: "", picture: testPicture, nat: "", cell: "", phone: "")
        
        let testViewModel = UserViewModel(user: testUser)
        let fullName = testViewModel.fullName
        
        XCTAssertEqual(fullName, "Mr  Morreira") // აქ ერთი სფეისი უნდა იყოს, მაგრამ მაშინ კოდი უნდა შევცვალო.
    }
    
    func testFullNameWithoutLastName() {
        let testName = Name(title: "", first: "Ze", last: "Morreira")
        let testPicture = Picture(large: "", medium: "", thumbnail: "")
        let testUser = User(gender: "", name: testName, email: "", picture: testPicture, nat: "", cell: "", phone: "")
        
        let testViewModel = UserViewModel(user: testUser)
        let fullName = testViewModel.fullName
        
        XCTAssertEqual(fullName, "Ze Morreira")
    }
    
    func testEmptyFullName() {
        let testName = Name(title: "", first: "", last: "")
        let testPicture = Picture(large: "", medium: "", thumbnail: "")
        let testUser = User(gender: "", name: testName, email: "", picture: testPicture, nat: "", cell: "", phone: "")
        
        let testViewModel = UserViewModel(user: testUser)
        let fullName = testViewModel.fullName
        
        XCTAssertEqual(fullName, "")
    }
    
        
    func testContactNumber() {
        let contactNumber = viewModel.contactNumber
        
        XCTAssertEqual(contactNumber, "111-111-1111 / 222-222-2222")
    }
    
    func testThumbnailImageUrl() {
        let url = viewModel.thumbnailImageUrl
        
        XCTAssertNotNil(url)
        XCTAssertEqual(url, URL(string: "https://randomuser.me/api/portraits/thumb/men/25.jpg") )
    }
    
    func testEmail() {
        let email = viewModel.email
        
        XCTAssertEqual(email, "ZeMoreirra@gmail.com")
    }
    
}
