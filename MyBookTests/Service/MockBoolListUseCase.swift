//
//  MockService.swift
//  MyBookTests
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import Foundation
@testable import MyBook


class MockRepository: BookRepositoryProtocol {
    func get() -> [MyBook] {
        let arr = [MyBook]()
        return arr
    }
    
    func add(_ item: MyBook) {
        
    }
    
    func delete(_ item: MyBook) {
        
    }
    
    
    var completionHandler: Result<BookShop,APIError>!
    
    func fetchBooks(query: String, completion: @escaping BookAPIResultCompletionHandler) {
        completion(completionHandler)

    }
   
}


