//
//  TradingModelResponse.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Foundation

struct TradingModelResponse: Decodable {
    let id: String
    let name: String
    let icon: String
    let valueOfOne: Double
    let abbreviation: String
}

extension TradingModelResponse {
    func toDomain() -> TradingModel {
        .init(id: id, name: name, icon: icon, valueOfOne: valueOfOne, abbreviation: abbreviation)
    }
}
