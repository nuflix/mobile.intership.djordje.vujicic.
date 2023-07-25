//
//  CryptoListViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/24/23.
//

import SwiftUI
import Alamofire
import Combine


class CryptoListViewModel: ObservableObject {
    
    
    @Published var items: [CryptoListItem] = []
    
    private let repository: CryptoRepositoryInterface
    var tokens: Set<AnyCancellable> = []
    
    init(repository: CryptoRepositoryInterface) {
        self.repository = repository
    }
    
    func getCrypto() {
        repository.getCrypto().sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] result in
            if let safeSelf = self {
                
                safeSelf.items = result
                
            }
        }.store(in: &tokens)
    }
}
