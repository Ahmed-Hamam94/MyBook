//
//  BookListTest.swift
//  MyBookTests
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import XCTest
@testable import MyBook
final class BookListUseCaseTest: XCTestCase {
        var bookListUseCase: BookListUseCaseProtocol!
        var mockService: MockRepository!
    
        override func setUp() {
            super.setUp()
            mockService = MockRepository()
            bookListUseCase = BookListUseCase(bookRepository: mockService)
        }
        
        override func tearDown() {
            super.tearDown()
            bookListUseCase = nil
            mockService = nil
        }
   
        func test_getBooks_whenRequestisValid_shouldReturnNotNilBook() {
            // given
            let expectaions = self.expectation(description: "expecting get books completion")
            var capturedBooks: [MyBook]?
            
                let mockBooks = BookShop(kind: "book", totalItems: 4, items: [Items(kind: "b", id: "0", etag: "h", selfLink: "h", volumeInfo: VolumeInfo(title: "Swift For Dummies", authors: ["Jesse Feiler"], publisher: "John Wiley & Sons", publishedDate: "2015-02-24", description: "Get up and running with Swift—swiftly Brimming with expert advice and easy-to-follow instructions, Swift For Dummies shows new and existing programmers how to quickly port existing Objective-C applications into Swift and get into the swing of the new language like a pro.", industryIdentifiers: [IndustryIdentifiers(type: "h", identifier: "h")], readingModes: ReadingModes(text: false, image: false), pageCount: 384, printType: "h", categories: ["Computers"], averageRating: 5, ratingsCount: 6, maturityRating: "h", allowAnonLogging: false, contentVersion: "h", panelizationSummary: PanelizationSummary(containsEpubBubbles: false, containsImageBubbles: false), imageLinks: ImageLinks(smallThumbnail: "h", thumbnail: "c200"), language: "h", previewLink: "http://books.google.com.eg/books?id=cPowBgAAQBAJ&printsec=frontcover&dq=%5Cswift&hl=&cd=1&source=gbs_api", infoLink: "h", canonicalVolumeLink: "h"), saleInfo: SaleInfo(country: "", saleability: "", isEbook: false, listPrice: ListPrice(amount: 0.0, currencyCode: ""), retailPrice: RetailPrice(amount: 0.0, currencyCode: ""), buyLink: "", offers: [Offers(finskyOfferType: 0, listPrice: ListPrice(amount: 0.0, currencyCode: ""), retailPrice: RetailPrice(amount: 0.0, currencyCode: ""))]))])
            
            let mappingBooks = [MyBook(bookImage: "c200", bookTitle: "Swift For Dummies", ratingsCount: 3.0, author: ["Jesse Feiler"], description:  "Get up and running with Swift—swiftly Brimming with expert advice and easy-to-follow instructions, Swift For Dummies shows new and existing programmers how to quickly port existing Objective-C applications into Swift and get into the swing of the new language like a pro.", publisherName: "John Wiley & Sons", publisherDate:"2015-02-24", pageCount: "384", category: ["Computers"], previewLink: "http://books.google.com.eg/books?id=cPowBgAAQBAJ&printsec=frontcover&dq=%5Cswift&hl=&cd=1&source=gbs_api")]

            //when
            mockService.completionHandler = .success(mockBooks)
            bookListUseCase.fetchBooks(query: "h") { [weak self] books in
                guard let self else { return }
               capturedBooks = books
                expectaions.fulfill()
            }
            
            //
            // Call Function
            //
            waitForExpectations(timeout: 5, handler: nil)
            // then
          //  XCTAssertNotNil(capturedBooks, "expected not nil books array")
            XCTAssertEqual(capturedBooks, mappingBooks, "")
        }
        
    func test_getBooks_whenRequestisUnValid_shouldFail() {
        // given
        let expectaions = self.expectation(description: "expecting get books completion")
        var capturedBooks: [MyBook]?
        mockService.completionHandler = .failure(APIError.errorDecoding)

        // when
        bookListUseCase.fetchBooks(query: "h") { books in
            expectaions.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
        // then
        XCTAssertNil(capturedBooks)
    }
}
