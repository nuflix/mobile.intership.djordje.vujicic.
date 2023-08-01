//
//  TabViewImage.swift
//  CryptoWallet
//
//  Created by Administrator on 7/31/23.
//

import Foundation

let dashboardIconSelected = "dashboardIconSelected"
let dashboardIcon = "dashboardIcon"
let cryptoListIconSelected = "cryptoListIconSelected"
let cryptoListIcon = "cryptoListIcon"
let userIconSelected = "userIconSelected"
let userIcon = "userIcon"
let settingsIconSelected = "settingsIconSelected"
let settingsIcon = "settingsIcon"

extension LoggedInView {
    enum curPage {
        case dashboard
        case cryptoList
        case userV
        case settingsV
    }
}
