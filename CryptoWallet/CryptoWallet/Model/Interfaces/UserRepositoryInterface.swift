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
    func createAccount (request: UserPostModel) -> AnyPublisher<EmptyModel, AFError>
    
    func login (request: UserLoginModel) -> AnyPublisher<JwtModel, AFError>
    
    func checkIfLogged() -> AnyPublisher<CurrentUser, AFError>
    
    func logout() -> Void
}
