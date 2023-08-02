//
//  Repository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Alamofire
import Combine
import Foundation

class UserRepository: UserRepositoryInterface {
    
    func logout() {
        UserDefaultsController.deleteUser()
        DatabaseService.shared.deleteData()
    }
    
    func createAccount(request: UserPostModel) -> AnyPublisher<EmptyModel, AFError> {
        return Networker.shared.fetch(url: "/users/register", request: request.self, method: .post).map { (responseData: EmptyModel) in
            responseData as EmptyModel
        }
        .eraseToAnyPublisher()
    }

    func login(request: UserLoginModel) -> AnyPublisher<JwtModel, AFError> {
        return Networker.shared.fetch(url: "/users/login", request: request.self, method: .post).map { (responseData: JwtModel) in
            responseData
        }
        .eraseToAnyPublisher()
    }

    func checkIfLogged() -> AnyPublisher<CurrentUser, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/users/current", method: .get).map { (response: CurrentUserResponse) in
            response.toDomain()
        }
        .eraseToAnyPublisher()
    }
}
