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

    func createAccount(request: UserPostModel) -> AnyPublisher<EmptyModel, MyError> {
        return Networker.shared.fetch(url: "/users/register", request: request.self, method: .post).map { (responseData: EmptyModel) in
            responseData as EmptyModel
        }
        .mapError({ error in
            error.message(.register)
        })
        .eraseToAnyPublisher()
    }

    func login(request: UserLoginModel) -> AnyPublisher<JwtModel, MyError> {
        return Networker.shared.fetch(url: "/users/login", request: request.self, method: .post).map { (responseData: JwtModel) in
            responseData
        }
        .mapError({ error in
            error.message(.login)
        })
        .eraseToAnyPublisher()
    }

    func checkIfLogged() -> AnyPublisher<CurrentUser, AFError> {
        return Networker.shared.fetchWithoutReq(url: "/users/current", method: .get).map { (response: CurrentUserResponse) in
            response.toDomain()
        }
        .eraseToAnyPublisher()
    }
}
