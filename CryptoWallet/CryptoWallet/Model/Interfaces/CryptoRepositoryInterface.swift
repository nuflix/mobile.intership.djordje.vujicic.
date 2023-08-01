//
//  CryptoRepositoryInterface.swift
//  CryptoWallet
//
//  Created by Administrator on 7/24/23.
//

import Foundation
import Combine
import Alamofire


protocol CryptoRepositoryInterface {
    func getCrypto () -> AnyPublisher<[CryptoListItem], AFError>
    func find(id: String) -> CryptoWalletItem?
}
