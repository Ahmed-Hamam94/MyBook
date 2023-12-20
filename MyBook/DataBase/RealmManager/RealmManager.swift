//
//  RealmManager.swift
//  MyBook
//
//  Created by Ahmed Hamam on 12/12/2023.
//

import Foundation
import RealmSwift

protocol RealmConvertible {
    associatedtype RealmObjectType: Object
    func convertToRealm() -> RealmObjectType
    static func createFromRealm(_ realmObject: RealmObjectType) -> Self
}

protocol RealmProtocol {
    func saveInRealm<T:RealmConvertible>(object: T, in realm: Realm)
   // func deleteFromRealm<T:RealmConvertible>(object: T, in realm: Realm)
    func getFromRealm<T: RealmConvertible>(type: T.Type, from realm: Realm) -> [T]
    func deleteFromRealm(object: MyBook)
}

class RealmManager: RealmProtocol {
    
    var realm = try! Realm()
    
    func saveInRealm<T>(object: T, in realm: RealmSwift.Realm) where T : RealmConvertible {
        do {
            try realm.write({
                let realmObject = object.convertToRealm()
                realm.add(realmObject)
            })
        }catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func deleteFromRealm(object: MyBook) {
        do {
            let realm = try Realm()
            try realm.write {
                if let objectToDelete = realm.objects(Book.self).filter("bookTitle == %@", object.title).first {
                    realm.delete(objectToDelete)
                }
            }
        }catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func getFromRealm<T>(type: T.Type, from realm: RealmSwift.Realm) -> [T] where T : RealmConvertible {
        let realmObjects = realm.objects(T.RealmObjectType.self)
        var objects: [T] = []
        for realmObject in realmObjects {
            objects.append(T.createFromRealm(realmObject))
        }
        return objects

    }
    

    
    
    func saveInRealm(data: RealmSwift.Object) {
       
    }
    
    func deleteFromRealm(data: RealmSwift.Object) {
        do {
            try realm.write({
                realm.delete(data)
            })
        }catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func getFromRealm() -> Results<Book>{
        
        return realm.objects(Book.self)
    }
    
}
