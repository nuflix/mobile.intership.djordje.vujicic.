//
//  CryptoRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/24/23.
//

import Foundation
import Alamofire
import Combine

class CryptoRepository: CryptoRepositoryInterface {
    
    func getCrypto () -> AnyPublisher<[CryptoListItem], AFError> {

        return Networker.shared.fetchWithoutReq(url: "/cryptos", method: .get).map { (responseData: [CryptoListItemResponse]) in
            responseData.map { $0.toDomain() }
         }.eraseToAnyPublisher()
        
    }
    
    
    func find(id: String) -> CryptoWalletItem? {
        return DatabaseService.shared.find(type: CryptocurrencyStorage(cryptocurrencyId: "", name: "", abbreviation: "", icon: "", valueOfOne: 0, sum: 1, id: ""), id: id).first?.toDomain() 
        
    }
 
    
}
