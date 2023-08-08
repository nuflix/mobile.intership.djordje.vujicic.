//
//  TradingRepositoryInterface.swift
//  CryptoWallet
//
//  Created by Administrator on 7/27/23.
//

import SwiftUI
import Alamofire
import Combine

protocol TradingRepositoryInterface {
    func fetchCryptoById(id: String) -> AnyPublisher<TradingModel, AFError>
    
    func buyCrypto(id: String, val: Double) -> AnyPublisher<EmptyModel, MyError>
    
    func sellCrypto(id: String, val: Double) -> AnyPublisher<SuccessSell, MyError>
    
    func update(ob: CryptocurrencyStorage)
}
