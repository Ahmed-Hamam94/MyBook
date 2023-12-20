//
//  RepositoryBookTest.swift
//  MyBookTests
//
//  Created by Ahmed Hamam on 13/12/2023.
//

import XCTest
@testable import MyBook

final class RepositoryBookTest: XCTestCase {
    var mockRepository: MockRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockRepository()
    }
    
    override func tearDown() {
        super.tearDown()
        mockRepository = nil
    }
    
func test_getBooks_whenRequestisUnValid_shouldFail() {
    // given
    let expectaions = self.expectation(description: "expecting get books completion")
    var capturedBooks: [Items]?
    mockRepository.completionHandler = .failure(APIError.errorDecoding)

    // when
    mockRepository.fetchBooks(query: "a") { result in
        switch result {
        case .success(let books):
            capturedBooks = books.items
            expectaions.fulfill()
        case .failure(_): break
        }
    }
    waitForExpectations(timeout: 2, handler: nil)
    // then
    XCTAssertNil(capturedBooks)
}
}
