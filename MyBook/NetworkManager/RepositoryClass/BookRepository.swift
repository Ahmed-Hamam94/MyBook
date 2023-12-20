//
//  BookRepository.swift
//  MyBook
//
//  Created by Ahmed Hamam on 10/12/2023.
//

import Foundation
import RealmSwift

typealias BookAPIResultCompletionHandler = (Result<BookShop,APIError>) -> Void

protocol BookRepositoryProtocol {
    func fetchBooks( query: String , completion: @escaping BookAPIResultCompletionHandler )
    func get() -> [MyBook]
    func add(_ item: MyBook)
    func delete(_ item: MyBook)
}


class BookRepository: BookRepositoryProtocol {

   private let networkManager = NetworkManager()
    
    private let realmManager: RealmProtocol = RealmManager()
    
    func fetchBooks( query: String , completion: @escaping BookAPIResultCompletionHandler ) {
//        var parameters: [String:Any]? {
//            switch EndPoint.books(query: query) {
//             case .books(let query):
//                 return [
//                     "q": query,
//                     "maxResults": 30
//                 ]
//             }
//         }
        networkManager.request(endPoint: EndPoint.books(query: query), method: .Get, parameters: [
            "q": query,
            "maxResults": 30
        ], completion: completion)
    }
    
    func get() -> [MyBook] {
        do {
       return  try realmManager.getFromRealm(type: MyBook.self, from: Realm())

        }catch (let error){
            print(error.localizedDescription)
            return []
        }
    }
    
    func add(_ item: MyBook) {
        do {
            try realmManager.saveInRealm(object: item, in: Realm())
            print(item)
        }catch (let error){
            print(error.localizedDescription)
        }
    }
    
    func delete(_ item: MyBook) {
     realmManager.deleteFromRealm(object: item)
    }
  
}
