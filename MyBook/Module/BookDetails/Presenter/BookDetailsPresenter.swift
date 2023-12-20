//
//  BookDetailsPresenter.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import Foundation
protocol BookDetailsPresenterProtocol {
    func hanldeSecureImage() -> String
    func getItem() -> MyBook
    func getAuthor() -> String
    func getCategory() -> String
    func addToRealm()
    func deleteBooks()
    func getFromRealm() -> [MyBook]
    func isBookInFavorite() -> Bool
}

class BookDetailsPresenter:  BookDetailsPresenterProtocol{
    let bookRepository = BookRepository()
    var item: MyBook
    
    init(item: MyBook) {
        self.item = item
    }
    
    func getItem() -> MyBook {
        return item
    }
    
    func addToRealm() {
        bookRepository.add(item)
    }
    
    func deleteBooks() {
        bookRepository.delete(item)
    }
    
    func getFromRealm() -> [MyBook] {
        bookRepository.get()
    }

    func isBookInFavorite() -> Bool {
        let books = getFromRealm()
        for book in books {
            if book.title == item.title {
                return true
            }
        }
        return false
    }
    
    func hanldeSecureImage() -> String {
         var imageString = item.image
        if imageString.hasPrefix("http://") {
            if let range = imageString.range(of: "http://") {
                imageString.replaceSubrange(range, with: "https://")

                return imageString
            }
        } else {

            return imageString
        }
        return String()
    }
    
    func getAuthor() -> String {
         let author = item.author.joined(separator: "")
        return author
    }
    
    func getCategory() -> String {
        let category = item.category.joined(separator: "")
        return category
    }
    
}
