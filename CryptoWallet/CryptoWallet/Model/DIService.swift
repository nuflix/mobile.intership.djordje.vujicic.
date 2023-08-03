//
//  DIService.swift
//  CryptoWallet
//
//  Created by Administrator on 8/3/23.
//

import Foundation

class DIService {
    
    static let shared: DIService = {
        return DIService()
    }()
    
    lazy var userRepository = UserRepository()
    lazy var cryptoRepository = CryptoRepository()
    lazy var dashboardRepository = DashboardRepository()
    lazy var tradingRepository = TradingRepository()
    lazy var userInfoRepository = UserInfoRepository()
    
}
