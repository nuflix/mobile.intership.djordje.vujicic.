//
//  TitleTextComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct TitleTextComponentView: View {
    let title: String
    var body: some View {
        Spacer()
        Text(title)
            .bold()
            .foregroundColor(.white)
            .padding(.top, 20)
            .font(.system(size: 26))
        Spacer()
    }
}
