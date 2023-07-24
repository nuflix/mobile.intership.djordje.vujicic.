//
//  Repository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Foundation
import Alamofire
import Combine

class UserRepository: UserRepositoryInterface {
    
    func createAccount (url: String, request: UserPostModel) -> AnyPublisher<EmptyModel, AFError> {
        
        
        return Networker.shared.fetch(url: url, response: EmptyModel(), request: request.self).map { responseData in
            return responseData as EmptyModel
        }.eraseToAnyPublisher()
        
    }
    
    func login (url: String, request: UserLoginModel) -> AnyPublisher<JwtModel, AFError> {
        
        
        return Networker.shared.fetch(url: url, response: JwtModel(jwtToken: ""), request: request.self).map { responseData in
            return responseData as JwtModel
        }.eraseToAnyPublisher()
        
    }
    
}
