//
//  CryptoListViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/24/23.
//

import Alamofire
import Combine
import SwiftUI

class CryptoListViewModel: ObservableObject {
    @Published var items: [CryptoListItem] = []
    @Published var fetched: Bool = false

    private let repository: CryptoRepositoryInterface
    var tokens: Set<AnyCancellable> = []

    init(repository: CryptoRepositoryInterface) {
        self.repository = repository
    }

    func getCrypto() {
        repository.getCrypto().sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] result in
            self?.items = result
            self?.fetched = true

        }.store(in: &tokens)
    }

    func findCrypto(id: String) -> CryptoWalletItem? {
        repository.find(id: id)
    }
}
