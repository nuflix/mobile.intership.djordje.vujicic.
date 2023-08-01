//
//  CryptoWalletItem.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Foundation

struct CryptoWalletItem: Identifiable {
    let cryptocurrencyId: String
    let name: String
    let abbreviation: String
    let icon: String
    let valueOfOne: Double
    let sum: Double
    let id: String
}

extension CryptoWalletItem {
    func toStorable() -> CryptocurrencyStorage {
        .init(cryptocurrencyId: cryptocurrencyId, name: name, abbreviation: abbreviation, icon: icon, valueOfOne: valueOfOne, sum: sum, id: id)
    }
}
