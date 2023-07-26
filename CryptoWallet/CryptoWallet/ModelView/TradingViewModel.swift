//
//  TradingViewModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI
import Alamofire
import Combine

class TradingViewModel: ObservableObject {
    @Published var model = TradingModel(id: "bitcoin", name: "Bitcoin", icon: "", valueOfOne: 10945.00, abbreviation: "BTC")
    @Published var id: String
    
    private let repository: TradingRepository
    var tokens: Set<AnyCancellable> = []
    
    init(repository: TradingRepository, id: String) {
        self.repository = repository
        self.id = id
    }
    
    func fetchModel() {
        repository.fetchCryptoById(id: id).sink(receiveCompletion: { error in
            print("error: \(error)")
        }, receiveValue: { [weak self] response in
                self?.model = response
        }).store(in: &tokens)
    }
    
}
