//
//  TradingRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI
import Alamofire
import Combine

class TradingRepository {
    
    func fetchCryptoById(id: String) -> AnyPublisher<TradingModel, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/cryptos/\(id)", method: .get).map { (response: TradingModelResponse) in
            return response.toDomain()
        }
        .eraseToAnyPublisher()
    }
    
}
