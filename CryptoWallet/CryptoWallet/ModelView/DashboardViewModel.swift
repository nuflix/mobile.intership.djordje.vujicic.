//
//  DashboardViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Alamofire
import Combine
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var model = WalletModel(cryptocurrencies: [], totalBalance: 0.0)
    private let repository: DashboardRepositoryInterface
    var tokens: Set<AnyCancellable> = []

    init(repository: DashboardRepositoryInterface) {
        self.repository = repository
    }

    func fetchWallet() {
        repository.fetchWallet().sink { err in
            print("error: \(err)")
        } receiveValue: { [weak self] list in
            self?.model = list

            if !list.cryptocurrencies.isEmpty {
                self?.calculateBalance()
            }
        }.store(in: &tokens)
    }

    func calculateBalance() {
        let balance = model.cryptocurrencies.reduce(0) { result, a -> Double in
            result + (a.sum * a.valueOfOne)
        }

        model = WalletModel(cryptocurrencies: model.cryptocurrencies, totalBalance: balance)
    }
}
