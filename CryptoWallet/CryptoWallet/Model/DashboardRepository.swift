//
//  DashboardRepository.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Alamofire
import Combine
import RealmSwift
import SwiftUI

class DashboardRepository: DashboardRepositoryInterface {
    private var tokens: Set<AnyCancellable> = []

    func fetchNetwork() -> AnyPublisher<WalletModel, Error> {
        print("network")
        return Networker.shared.fetchWithoutReq(url: "/users/wallet", method: .get).map { (response: WalletResponse) in
            response.toDomain()
        }
        .handleEvents(receiveOutput: { [weak self] result in
            self?.saveData(obj: result)
        })
        .mapError({ afErr in
            afErr as Error
        })
        .eraseToAnyPublisher()
    }

    func fetchWallet() -> AnyPublisher<WalletModel, Error> {
        return DatabaseService.shared.readData(type: CryptocurrencyStorage())
            .flatMap({ [weak self] results in
                guard let self = self else { return Fail<WalletModel, Error>(error: NSError()).eraseToAnyPublisher() }
                if results.isEmpty {
                    return self.fetchNetwork()
                }
                let domainArray: [CryptoWalletItem] = results
                    .map {
                        $0.toDomain()
                    }
                return Just(WalletModel(cryptocurrencies: domainArray, totalBalance: 0))
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }

    func deleteData() {
        DatabaseService.shared.deleteData()
    }

    func saveData(obj: WalletModel) {
        for item in obj.cryptocurrencies {
            DatabaseService.shared.saveData(data: item.toStorable())
        }
    }
}
