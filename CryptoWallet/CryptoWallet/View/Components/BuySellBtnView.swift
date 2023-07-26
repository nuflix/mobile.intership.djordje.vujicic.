//
//  BuySellBtnView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI

struct BuySellBtnView: View {
    @Binding var active: Bool
    let text: String
    var body: some View {
        retBtn()
    }
    
    @ViewBuilder func retBtn() -> some View {
        if(active) {
            Button(text) {
                
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 60)
            .foregroundColor(.white)
            .background(Color("greenGrad"))
            
        } else {
            Button(text) {
                
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 60)
            .foregroundColor(.black)
            .background(Color(.white))
        }
    }
    
}

