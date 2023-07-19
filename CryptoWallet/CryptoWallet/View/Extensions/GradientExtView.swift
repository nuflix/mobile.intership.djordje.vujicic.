//
//  Gradient.swift
//  CryptoWallet
//
//  Created by Administrator on 7/19/23.
//

import SwiftUI
extension Gradient {
    public static var greenGrad: Gradient {
        Gradient(colors: [.blueGrad, .greenGrad])
    }

    public static var blueGrad: Gradient {
        Gradient(colors: [.blueGrad2Prim, .blueGrad2Sec])
    }
}
