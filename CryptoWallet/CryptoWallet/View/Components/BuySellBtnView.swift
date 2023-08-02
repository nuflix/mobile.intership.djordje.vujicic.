//
//  BuySellBtnView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI

struct BuySellBtnView: View {
    @State var selectedTab = 0
    @Binding var isActiveBuy: Bool
    let text: String
    
    var body: some View {
        retBtn()
    }
    
    @ViewBuilder func retBtn() -> some View {
        Picker("", selection: $selectedTab) {
            Text("buy").tag(0)
            Text("sell").tag(1)
        }
        .onChange(of: selectedTab, perform: { newValue in
            isActiveBuy = (0 == newValue)
        })
        .colorMultiply(.greenGrad)
        .pickerStyle(.segmented)
    }
    
}

