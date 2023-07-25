//
//  CryptoListItemIdentifiableModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/25/23.
//

import Foundation

struct CryptoListItem: Identifiable {
    let id: String
    let name: String
    let icon: String
    let valueOfOne: Double
    let abbreviation: String
    let id_coin = UUID()
}

