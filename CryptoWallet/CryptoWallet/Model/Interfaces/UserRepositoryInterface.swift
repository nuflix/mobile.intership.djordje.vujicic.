//
//  UserRepositoryService.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import Foundation
import Combine
import Alamofire

protocol UserRepositoryInterface {
    func createAccount (url: String, request: UserPostModel) -> AnyPublisher<EmptyModel, AFError>
    
    func login (url: String, request: UserLoginModel) -> AnyPublisher<JwtModel, AFError>
}
