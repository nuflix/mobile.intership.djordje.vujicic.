//
//  TradingRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Alamofire
import Combine
import SwiftUI

class TradingRepository: TradingRepositoryInterface {
    func update(ob: CryptocurrencyStorage) {
        DatabaseService.shared.updateData(ob: ob)
    }

    func buyCrypto(id: String, val: Double) -> AnyPublisher<EmptyModel, MyError> {
        return Networker.shared.fetchWithoutReq(url: "/users/buyCryptocurrency?cryptoId=\(id)&value=\(val)", method: .patch)
            .mapError({ error in
                error.message(.buy)
            })
            .eraseToAnyPublisher()
    }
    

    func sellCrypto(id: String, val: Double) -> AnyPublisher<SuccessSell, MyError> {
        return Networker.shared.fetchWithoutReq(url: "/users/sellCryptocurrency?cryptoId=\(id)&value=\(val)", method: .patch).map { (_: EmptyModel) in
            SuccessSell(message: "success")
        }
        .mapError({ error in
            error.message(.sell)
        })
        .eraseToAnyPublisher()
    }

    func fetchCryptoById(id: String) -> AnyPublisher<TradingModel, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/cryptos/\(id)", method: .get).map { (response: TradingModelResponse) in
            response.toDomain()
        }
        .eraseToAnyPublisher()
    }
}
