//
//  Virtusa_TaskTests.swift
//  Virtusa_TaskTests
//
//  Created by Apple on 29/01/24.
//

import XCTest
@testable import Virtusa_Task

final class Virtusa_TaskTests: XCTestCase {
    
    var artWorksViewModel: ArtWorksViewModel?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        artWorksViewModel = ArtWorksViewModel(network: NetworkManger())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        artWorksViewModel = nil
    }
    
    func testGetArtWorkDetails() {
        let expectation = self.expectation(description: "Get ArtWork Details")
        self.artWorksViewModel?.getArtWorksDetailsFromServerMethod(url: AppUrl.ArtWork) { result in
            if result == true {
                XCTAssertEqual(self.artWorksViewModel?.artWorksObj.data?.first?.title, "We Knew So Little Then/ I Know Even Less Now...")
            } else {
                XCTFail("Error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
