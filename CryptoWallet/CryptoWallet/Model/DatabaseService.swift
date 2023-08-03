//
//  DatabaseService.swift
//  CryptoWallet
//
//  Created by Administrator on 7/27/23.
//

import Foundation
import RealmSwift
import Realm
import Combine

class DatabaseService {
    
    static let shared: DatabaseService = {
        return DatabaseService()
    }()
    
    func saveData<T: RealmSwiftObject>(data: T) {
        
        let config = Realm.Configuration(
            schemaVersion: 2)
        // Use this configuration when opening realms
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        try! realm.write {
            realm.add(data)
        }
    }
    
    func readData<T: RealmFetchable>(type: T) -> AnyPublisher<Results<T>, Error> {
        let config = Realm.Configuration(
            schemaVersion: 2)
        // Use this configuration when opening realms
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        
        let objs = realm.objects(T.self)
        

        return objs.collectionPublisher.eraseToAnyPublisher()
        
    }
    
    func deleteData() {
        let config = Realm.Configuration(
            schemaVersion: 2)
        // Use this configuration when opening realms
        Realm.Configuration.defaultConfiguration = config
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
    
    func updateData(ob: CryptocurrencyStorage) {
        let realm = try! Realm()
        if let obj = realm.objects(CryptocurrencyStorage.self).where({ $0.id == ob.id }).first {
            try! realm.write {
                obj.valueOfOne = ob.valueOfOne
                obj.sum = ob.sum
            }
        } else {
            try! realm.write {
                realm.add(ob)
            }
        }
       
    }
    
    func find<T: RealmFetchable & StrIdInterface>(type: T, id: String) -> Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self).filter("id == %@", id)
    }
    
}
