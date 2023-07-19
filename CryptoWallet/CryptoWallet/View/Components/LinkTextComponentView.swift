//
//  LinkTextComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct LinkTextComponentView: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("greenGrad"))
    }
}
