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
    @Published var curVal: String
    @Published var id: String
    
    private let repository: TradingRepositoryInterface
    var tokens: Set<AnyCancellable> = []
    
    init(repository: TradingRepositoryInterface, id: String, curVal: Double = 0) {
        self.repository = repository
        self.id = id
        self.curVal = String(curVal)
    }
    
    func buy(val: Double) {
        repository.buyCrypto(id: id, val: val).sink(receiveCompletion: { error in
            print("error: \(error)")
        }, receiveValue: { [weak self] response in
                print("Success")
            self?.curVal = String(Double(self?.curVal ?? "0")! + val)
            self?.updateCrypto()
        }).store(in: &tokens)

    }
    
    func sell(val: Double) {
        repository.sellCrypto(id: id, val: val).sink(receiveCompletion: { error in
            print("error: \(error)")
        }, receiveValue: { [weak self] response in
            if response.message == "success" {
                self?.curVal = String(Double(self?.curVal ?? "0")! - val)
                self?.updateCrypto()
            } else {
                print(response.message)
            }
        }).store(in: &tokens)

    }
    
    func fetchModel() {
        repository.fetchCryptoById(id: id).sink(receiveCompletion: { error in
            print("error: \(error)")
        }, receiveValue: { [weak self] response in
                self?.model = response
        }).store(in: &tokens)
    }
    
    func updateCrypto() {
        DatabaseService.shared.updateData(ob: CryptocurrencyStorage(cryptocurrencyId: self.model.id, name: self.model.name, abbreviation: self.model.abbreviation, icon: self.model.icon, valueOfOne: self.model.valueOfOne, sum: Double(self.curVal)!, id: self.model.id))
    }
    
}
