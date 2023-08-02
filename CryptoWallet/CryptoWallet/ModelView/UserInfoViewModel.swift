//
//  UserInfoViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 8/1/23.
//

import Foundation
import Combine

class UserInfoViewModel: ObservableObject {
    @Published var user: CurrentUser
    private let repository: UserInfoRepositoryInterface
    private var tokens: Set<AnyCancellable> = []
    
    init(user: CurrentUser, repository: UserInfoRepositoryInterface) {
        self.user = user
        self.repository = repository
    }
    
    func getUser() {
        repository.getUser().sink(receiveCompletion: { error in
            print("error \(error)")
        }, receiveValue: { [weak self] result in
            self?.user = result
        })
        .store(in: &tokens)
    }
    
    func addMoney(val: String) {
        repository.addMoney(val: Double(val) ?? 0).sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] result in
            print("success")
            self?.getUser()
        }
        .store(in: &tokens)

    }
    
}
