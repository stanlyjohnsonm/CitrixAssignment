//
//  CitrixAssignmentTests.swift
//  CitrixAssignmentTests
//
//  Created by Stanly Johnson on 09/06/22.
//

import XCTest
@testable import CitrixAssignment

class CitrixAssignmentTests: XCTestCase {
    
    var popularNewsAPIUrl: String = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=ZEmaGpAvuNrmZFJ8qR1EhtOHkaBVzA2u"
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testPopularNewsAPI() throws {
        let viewModel = NewsViewModel()
        viewModel.callPopularNewsAPI(apiUrl: popularNewsAPIUrl) { isSuccess in
            XCTAssert(isSuccess, "API call is not success")
        }
    }
    
    func testPopularNewsCount() throws {
        let viewModel = NewsViewModel()
        viewModel.callPopularNewsAPI(apiUrl: popularNewsAPIUrl) { isSuccess in
            if isSuccess {
                let newsCount = viewModel.numberOfPopularNews()
                XCTAssertTrue(newsCount > 0, "Failed to fetch news from API")
            }
        }
    }
    
}
