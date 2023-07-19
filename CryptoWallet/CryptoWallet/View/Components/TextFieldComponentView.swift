//
//  TextFieldComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct TextFieldComponentView: View {
    let placeholder: String;
    @State private var text: String = ""
    var body: some View {
        TextField(placeholder, text: $text)
            .overlay(
                Divider()
                    .offset(x: 0, y: 20)
            )
    }
}

