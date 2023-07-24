//
//  PostModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Foundation

struct PostModel: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
