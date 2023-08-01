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
    func buyCrypto(id: String, val: Double) -> AnyPublisher<EmptyModel, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/users/buyCryptocurrency?cryptoId=\(id)&value=\(val)", method: .patch)
            .eraseToAnyPublisher()
    }

    func sellCrypto(id: String, val: Double) -> AnyPublisher<SuccessSell, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/users/sellCryptocurrency?cryptoId=\(id)&value=\(val)", method: .patch).map { (response: EmptyModel) in

            return SuccessSell(message: "success")
        }
        .eraseToAnyPublisher()
    }

    func fetchCryptoById(id: String) -> AnyPublisher<TradingModel, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/cryptos/\(id)", method: .get).map { (response: TradingModelResponse) in
            response.toDomain()
        }
        .eraseToAnyPublisher()
    }
}
