//
//  CryptoWalletResponse.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Foundation

struct WalletResponse: Decodable {
    let cryptocurrencies: [CryptoWalletItemResponse]
    let totalBalance: Double
}

struct CryptoWalletItemResponse: Decodable {
    let cryptocurrencyId: String
    let name: String
    let abbreviation: String
    let icon: String
    let valueOfOne: Double
    let sum: Double
}


extension WalletResponse {
    func toDomain() -> WalletModel {
        .init(cryptocurrencies: toCryptocurrencies(), totalBalance: totalBalance)
    }
    
    func toCryptocurrencies() -> [CryptoWalletItem] {
        cryptocurrencies.map {
            $0.toDomain()
        }
    }
}

extension CryptoWalletItemResponse {
    func toDomain() -> CryptoWalletItem {
        .init(cryptocurrencyId: cryptocurrencyId, name: name, abbreviation: abbreviation, icon: icon, valueOfOne: valueOfOne, sum: sum, id: cryptocurrencyId)
    }
}
