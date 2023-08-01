//
//  CryptocurrencyStorage.swift
//  CryptoWallet
//
//  Created by Administrator on 7/27/23.
//

import Foundation
import Realm
import RealmSwift

class CryptocurrencyStorage: Object, StrIdInterface {
    @Persisted var cryptocurrencyId: String
    @Persisted var name: String
    @Persisted var abbreviation: String
    @Persisted var icon: String
    @Persisted var valueOfOne: Double
    @Persisted var sum: Double
    @Persisted(primaryKey: true) var id: String
    
    
    convenience init(cryptocurrencyId: String, name: String, abbreviation: String, icon: String, valueOfOne: Double, sum: Double, id: String) {
            self.init()
            self.cryptocurrencyId = cryptocurrencyId
            self.name = name
            self.abbreviation = abbreviation
            self.icon = icon
            self.valueOfOne = valueOfOne
            self.sum = sum
            self.id = id
    }
    
}

extension CryptocurrencyStorage {
    func toDomain() -> CryptoWalletItem {
        .init(cryptocurrencyId: cryptocurrencyId, name: name, abbreviation: abbreviation, icon: icon, valueOfOne: valueOfOne, sum: sum, id: id)
    }
}
