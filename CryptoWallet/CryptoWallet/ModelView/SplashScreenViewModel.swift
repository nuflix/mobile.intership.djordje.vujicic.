//
//  SplashScreenViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/28/23.
//

import Combine
import Foundation

class SplashScreenViewModel: ObservableObject {
    private var tokens: Set<AnyCancellable> = []
    let repository: UserRepositoryInterface
    @Published var isLogged: Bool = false

    init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    func checkIfLogged() {
        repository.checkIfLogged().sink { error in
            print(error)
        } receiveValue: { [weak self] _ in
            self?.isLogged = true
        }.store(in: &tokens)
    }
}
