//
//  PassFieldComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct PassFieldComponentView: View {
    let placeholder: String
    @Binding var pass: String
    var body: some View {
        SecureField(placeholder, text: $pass)
            .overlay(
                Divider()
                    .offset(x: 0, y: 20)
            )
    }
}
