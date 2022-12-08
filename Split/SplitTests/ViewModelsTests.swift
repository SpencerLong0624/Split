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
        activityviewmodel.add(bill)
        XCTAssertNoThrow(activityviewmodel.add(bill))
        XCTAssertNoThrow(activityviewmodel.search(searchText: "test"))
    }
    
    func testBillRepository() {
        var bill = Bill(bill_owers: [], bill_payers: [], date: "", description: "", title: "test", items: [])
        var billrepo = BillRepository()
        var bills = billrepo.get()
        XCTAssertNotNil(bills)
        XCTAssertNoThrow(billrepo.add(bill))
        bill.title = "test_update"
        XCTAssertEqual(bill.title, "test_update")
        XCTAssertNoThrow(billrepo.update(bill))
        XCTAssertNoThrow(billrepo.remove(bill))

    }
    
    func testuserRepository() {
        var user = User(balance_owed: 0, balance_owed_to: 0, email: "", friends: [], full_name: "test_user", phone_number: "")
        let userRepo = UserRepository()
        var all_users = userRepo.get()
        XCTAssertNotNil(all_users)
        XCTAssertNoThrow(userRepo.add(user))
        user.phone_number = "70402567"
        XCTAssertNoThrow(userRepo.update(user))
        XCTAssertNoThrow(userRepo.remove(user))

    }
    
    

}
