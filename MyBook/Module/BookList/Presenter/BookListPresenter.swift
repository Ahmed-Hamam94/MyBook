//
//  BookListPresenter.swift
//  MyBook
//
//  Created by Ahmed Hamam on 11/12/2023.
//

import Foundation

protocol BookListPresenterProtocol {
    var myBooks: [MyBook] { get set }
    var reloadUI: () -> Void { get set }
    var showCollectionBackGround: () -> Void { get set }
    var stopIndicator: () -> Void { get set }
    func fetchBooks()
    func removeBooks()
    func showBackGroundView()
    func showMessage(isConnected: Bool)
}

class BookListPresenter: BookListPresenterProtocol{
    let homeUseCase: BookListUseCaseProtocol = BookListUseCase(bookRepository: BookRepository())
    var myBooks: [MyBook] = [MyBook]()
    var reloadUI: () -> Void = {}
    var showCollectionBackGround: () -> Void = {}
    var stopIndicator: () -> Void = {}
    weak var delegate: BookListViewControllerProtocol?
    let swiftMessage = SwiftMessage()
    let search: String
    
    init(search: String) {
        self.search = search
    }
    
    func fetchBooks() {
        homeUseCase.fetchBooks(query: search) { [weak self] books in
            guard let self = self else { return }
           self.myBooks = books
            self.stopIndicator()
            if books.count == 0{
               self.showCollectionBackGroundView()
             // delegate?.collectionWillShowBackGroundView(self)
            } else if books.count != 0{
           self.reloadUI()
             //   delegate?.viewControllerWillReloadUI(self)
            }
        }
    }
    
    func showCollectionBackGroundView() {
        showCollectionBackGround()
    }
    
    func removeBooks() {
        myBooks.removeAll()
    }
    
    func showBackGroundView() {
        ConnectionManger.shared.showBackGroundView = { [weak self] show in
            guard let self = self else { return }
            switch show {
            case true:
              self.showMessage(isConnected: true)
            case false:
               self.showMessage(isConnected: false)
            }
        }
    }
    func showMessage(isConnected: Bool) {
        if isConnected{
            swiftMessage.swiftMessage(title: "Success", body: Connection.Reachable.rawValue, color: .success, layout: .messageView, style: .top)
            delegate?.viewControllerWillShowBackGround(self, show: false)

        }else{
            swiftMessage.swiftMessage(title: "Failure", body: Connection.NotReachable.rawValue, color: .error, layout: .messageView, style: .top)
            removeBooks()
            delegate?.viewControllerWillShowBackGround(self, show: true)
      }
    }
    
}
