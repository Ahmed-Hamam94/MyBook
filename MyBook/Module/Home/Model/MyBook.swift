//
//  MyBook.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import Foundation

struct MyBook: Equatable {
    let image: String
    let title: String
    let ratingsCount: Double
    let author: [String]
    let description: String
    let publisherName: String
    let publisherDate: String
    let pageCount: String
    let category: [String]
    let previewLink: String
}

extension MyBook: RealmConvertible {
    typealias RealmObjectType = Book
    
    func convertToRealm() -> Book {
        let bookRealm = Book()
        bookRealm.bookImage = image
        bookRealm.bookTitle = title
        bookRealm.ratingsCount = ratingsCount
        bookRealm.bookDescription = description
        bookRealm.publisherName = publisherName
        bookRealm.publisherDate = publisherDate
        bookRealm.pageCount = pageCount
        bookRealm.previewLink = previewLink
        let realmAuthor = RealmBookAuthors()
        realmAuthor.author = author.joined(separator: "")
        let realCategory = RealmBookCategory()
        realCategory.category = category.joined(separator: "")
        
        return bookRealm
    }
    
    static func createFromRealm(_ realmObject: Book) -> MyBook {
        let bookTitle = realmObject.bookTitle
        let publisherName = realmObject.publisherName
        let publishedDate = realmObject.publisherDate
        let description = realmObject.bookDescription
        let pageCount = realmObject.pageCount
        let ratingsCount = realmObject.ratingsCount
        let bookImage = realmObject.bookImage
        let previewLink = realmObject.previewLink
        var authors: [String] = []
        for author in realmObject.author {
            authors.append(author.author)
        }
        var categories: [String] = []
        for category in categories {
            categories.append(category)
        }
        return MyBook(image: bookImage, title: bookTitle, ratingsCount: ratingsCount, author: authors, description: description, publisherName: publisherName, publisherDate: publishedDate, pageCount: pageCount, category: categories, previewLink: previewLink)
    }
    
    
    
    
    
}
