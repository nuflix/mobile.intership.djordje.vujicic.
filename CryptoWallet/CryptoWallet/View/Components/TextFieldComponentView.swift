//
//  TextFieldComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct TextFieldComponentView: View {
    let placeholder: String
    @Binding var text: String
    let disabled: Bool
    var body: some View {
        textField()
    }
    
    @ViewBuilder func textField() -> some View {
        
        if(disabled) {
            TextField(placeholder, text: $text)
                .overlay(
                    Divider()
                        .offset(x: 0, y: 20)
                )
                .disabled(true)
                .foregroundColor(.gray)
        } else {
            TextField(placeholder, text: $text)
                .overlay(
                    Divider()
                        .offset(x: 0, y: 20)
                )
        }
    }
    
}
