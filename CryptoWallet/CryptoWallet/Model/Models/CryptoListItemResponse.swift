//
//  CryptoListItemModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import Foundation

struct CryptoListItemResponse: Decodable {
    let id: String
    let name: String
    let icon: String
    let valueOfOne: Double
    let abbreviation: String
}

extension CryptoListItemResponse {
    func toDomain() -> CryptoListItem {
        .init(id: id, name: name, icon: icon, valueOfOne: valueOfOne, abbreviation: abbreviation)    
    }
}
