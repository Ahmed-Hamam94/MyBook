//
//  HomeUseCase.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import Foundation

protocol BookListUseCaseProtocol {
    var myBooks: [MyBook] { get }
    func fetchBooks( query: String, completion: @escaping ([MyBook]) -> Void )
}

class BookListUseCase: BookListUseCaseProtocol {
   // let bookRepository: BookRepositoryProtocol = BookRepository()
     let bookRepository: BookRepositoryProtocol
    var myBooks: [MyBook] = [MyBook]()
    private var booksResult = [Items]()
    
    init(bookRepository: BookRepositoryProtocol) {
        self.bookRepository = bookRepository
    }
    
    func fetchBooks( query: String, completion: @escaping ([MyBook]) -> Void ) {
        bookRepository.fetchBooks(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let books):
                guard let items = books.items else { return }
                self.booksResult = items
                self.myBooks = self.mappingToUIModel(books: self.booksResult)
                completion(myBooks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func mappingToUIModel(books: [Items]) -> [MyBook] {
        books.map{(MyBook(image: $0.volumeInfo?.imageLinks?.thumbnail ?? "", title: $0.volumeInfo?.title ?? "", ratingsCount: Double($0.volumeInfo?.ratingsCount ?? 0), author: $0.volumeInfo?.authors ?? [], description: $0.volumeInfo?.description ?? "", publisherName: $0.volumeInfo?.publisher ?? "", publisherDate: $0.volumeInfo?.publishedDate ?? "", pageCount: "\($0.volumeInfo?.pageCount ?? 0)", category: $0.volumeInfo?.categories ?? [], previewLink: $0.volumeInfo?.previewLink ?? ""))}
 
    }
}
