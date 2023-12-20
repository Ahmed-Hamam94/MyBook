//
//  HomePresenter.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import Foundation
import Reachability

protocol HomePresenterProtocol {
    func getSearchText() -> String
    func removeLeadingTrailingSpacesAndNewlines(_ inputString: String) -> String 
}

class HomePresenter: HomePresenterProtocol {
    let homeUseCase: BookListUseCaseProtocol = BookListUseCase(bookRepository: BookRepository())
    private let swiftMessage = SwiftMessage()
    private var trimmedSearch = ""
    var search: String?
    
    init(search: String?) {
        self.search = search
    }
    
//    func handleText( completion: @escaping (Bool) -> Void ) {
//        guard let query = search else { return }
//       let trimmedSearch = query.trimmingCharacters(in: .whitespacesAndNewlines)
//  let regexPattern = "\\s{2,}\\w+"
//        let regex = try? NSRegularExpression(pattern: regexPattern)
//        let range = NSRange(location: 0, length: trimmedSearch.utf16.count)
//        let matches = regex?.matches(in: trimmedSearch, options: [], range: range)
//        if mat
//    }
    
    func removeLeadingTrailingSpacesAndNewlines(_ inputString: String) -> String {
            var stringWithoutNewlines = inputString.replacingOccurrences(of: "\n", with: "")
            stringWithoutNewlines = stringWithoutNewlines.trimmingCharacters(in: .whitespacesAndNewlines)
            while stringWithoutNewlines.contains("  ") {
                stringWithoutNewlines = stringWithoutNewlines.replacingOccurrences(of: "  ", with: " ")
            }
            return stringWithoutNewlines
        }
    
    func getSearchText() -> String{
      
        return trimmedSearch
    }
}
