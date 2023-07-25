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
    
    func createAccount (request: UserPostModel) -> AnyPublisher<EmptyModel, AFError> {
        
        
        return Networker.shared.fetch(url: "/users/register", request: request.self, method: .post).map { (responseData: EmptyModel) in
            return responseData as EmptyModel
        }.eraseToAnyPublisher()
        
    }
    
    func login (request: UserLoginModel) -> AnyPublisher<JwtModel, AFError> {
        
        
        return Networker.shared.fetch(url: "/users/login", request: request.self, method: .post).map { (responseData: JwtModel) in
            return responseData
        }.eraseToAnyPublisher()
        
    }
    
}
