//
//  DashboardRepositoryInterface.swift
//  CryptoWallet
//
//  Created by Administrator on 7/27/23.
//

import SwiftUI
import Alamofire
import Combine
import RealmSwift

protocol DashboardRepositoryInterface {
    func fetchNetwork() -> AnyPublisher<WalletModel, Error>
    func fetchWallet() -> AnyPublisher<WalletModel, Error>
    func deleteData()
    func saveData(obj: WalletModel)
}
