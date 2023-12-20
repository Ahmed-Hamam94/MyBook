//
//  Book.swift
//  MyBook
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import Foundation
import RealmSwift

class Book: Object {
    @Persisted var bookImage: String = ""
    @Persisted var bookTitle: String = ""
    @Persisted var ratingsCount: Double = 0.0
    @Persisted var author = List<RealmBookAuthors>()
    @Persisted var bookDescription: String = ""
    @Persisted var publisherName: String = ""
    @Persisted var publisherDate: String = ""
    @Persisted var pageCount: String = ""
    @Persisted var category = List<RealmBookCategory>()
    @Persisted var previewLink: String = ""
}
//extension Book {
//    convenience init(mapping: MyBook) {
//        self.init()
//        self.bookImage = mapping.bookImage
//        self.bookTitle = mapping.bookTitle
//        self.ratingsCount = mapping.ratingsCount
//        self.author = mapping.author.joined(separator: "")
//        self.bookDescription = mapping.description
//        self.publisherName = mapping.publisherName
//        self.publisherDate = mapping.publisherDate
//        self.pageCount = mapping.pageCount
//        self.category = mapping.category.joined(separator: "")
//        self.previewLink = mapping.previewLink
//    }
//}
class RealmBookAuthors: Object {
    @Persisted var author: String = ""
}

class RealmBookCategory: Object {
    @Persisted var category: String = ""
}
