//
//  CurrentUserResponse.swift
//  CryptoWallet
//
//  Created by Administrator on 7/28/23.
//

import Foundation

struct CurrentUserResponse: Decodable {
    let currentCardBalance: Double
    let email: String
    let firstName: String
    let lastName: String
}

extension CurrentUserResponse {
    func toDomain() -> CurrentUser {
        .init(currentCardBalance: currentCardBalance, email: email, firstName: firstName, lastName: lastName)
    }
}
