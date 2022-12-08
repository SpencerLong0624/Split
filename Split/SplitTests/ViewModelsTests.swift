//
//  ViewModelsTest.swift
//  SplitTests
//
//  Created by Uzair Umar on 07/12/2022.
//

import XCTest
@testable import Split

final class ViewModelsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testUserViewModel() {
        let user = User(balance_owed: 0, balance_owed_to: 0, email: "", friends: [], full_name: "", phone_number: "")
        let userviewmodel = UserViewModel(user:user)
        
        XCTAssertNoThrow(userviewmodel.add(user))
        XCTAssertNoThrow(userviewmodel.update(user: user))
        XCTAssertNoThrow(userviewmodel.remove())
    }
    
    func testActivityViewModel(){
        let activityviewmodel = ActivityViewModel()
        let bill = Bill(bill_owers: [], bill_payers: [], date: "", description: "", title: "test", items: [])
        XCTAssertNoThrow(activityviewmodel.add(bill))
        XCTAssertNoThrow(activityviewmodel.search(searchText: ""))
    }

}
