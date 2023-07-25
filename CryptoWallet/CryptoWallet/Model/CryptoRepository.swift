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
       
        print(UserDefaultsController.getJwt() ?? "none")
        return Networker.shared.fetchWithoutReq(url: "/cryptos", method: .get).map { (responseData: [CryptoListItemResponse]) in
            responseData.map { $0.toDomain() }
         }.eraseToAnyPublisher()
        
    }
    
 
    
}
