//
//  UserInfoRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 8/1/23.
//

import Foundation
import Alamofire
import Combine

protocol UserInfoRepositoryInterface {
    func getUser() -> AnyPublisher<CurrentUser, AFError>
    func addMoney(val: Double) -> AnyPublisher<EmptyModel, Error>
}
