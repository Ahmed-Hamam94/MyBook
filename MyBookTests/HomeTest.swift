//
//  HomeTest.swift
//  MyBookTests
//
//  Created by Ahmed Hamam on 13/12/2023.
//

import XCTest
@testable import MyBook

final class HomeTest: XCTestCase {
    var homePresenter: HomePresenterProtocol!
    
    override func setUp() {
        super.setUp()
        homePresenter = HomePresenter(search: "flower")
    }
    
    override func tearDown() {
        super.tearDown()
        homePresenter = nil
    }
    
    func test_SearchText_shouldBeValid() {
        // given
        let searchText =
        "flower"
        // when
        var trimmedString = homePresenter.removeLeadingTrailingSpacesAndNewlines("flower")
        // then
        XCTAssertEqual(trimmedString, searchText )
    }
}
