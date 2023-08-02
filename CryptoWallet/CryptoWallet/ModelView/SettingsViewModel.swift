//
//  SettingsViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 8/2/23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    private let repository: UserRepositoryInterface
    
    init(repository: UserRepositoryInterface) {
        self.repository = repository
    }
    
    func logout() {
        repository.logout()
    }
    
}
