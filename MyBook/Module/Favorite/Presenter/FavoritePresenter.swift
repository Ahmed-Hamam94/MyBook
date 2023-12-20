//
//  FavoritePresenter.swift
//  MyBook
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import Foundation
import RealmSwift

protocol FavoritePresenterProtocol {
    var reloadUI: (() -> Void) { get set }
    
    func readBooks()
    func getFavorites() -> [MyBook]
    func deleteBooks(book: MyBook)
}

class FavoritePresenter: FavoritePresenterProtocol {
    let bookRepository:BookRepositoryProtocol = BookRepository()
    var reloadUI: (() -> Void) = {}
   
    func readBooks() {
       let _ = bookRepository.get()
        reloadUI()
    }
    
    func getFavorites() -> [MyBook] {
        bookRepository.get()
    }
    
    func deleteBooks(book: MyBook) {
        bookRepository.delete(book)
        reloadUI()
    }

}

