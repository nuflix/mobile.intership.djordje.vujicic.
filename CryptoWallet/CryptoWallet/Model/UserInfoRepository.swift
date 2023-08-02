//
//  UserInfoRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 8/1/23.
//

import Alamofire
import Combine
import Foundation

class UserInfoRepository: UserInfoRepositoryInterface {
    func addMoney(val: Double) -> AnyPublisher<EmptyModel, Error> {
        Networker.shared.fetchWithoutReqAndFail(url: "/users/addMoney?value=\(val)", method: .patch)
            .flatMap({ _ in
                Just(EmptyModel())
            })
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getUser() -> AnyPublisher<CurrentUser, AFError> {
        Networker.shared.fetchWithoutReq(url: "/users/current", method: .get)
            .map { (user: CurrentUserResponse) in
                user.toDomain()
            }
            .eraseToAnyPublisher()
    }
}
