//
//  UserInfoTextBoxView.swift
//  CryptoWallet
//
//  Created by Administrator on 8/1/23.
//

import SwiftUI

struct UserInfoTextBoxView: View {
    let placeholder: String
    @Binding var text: String
    let isGrad: Bool

    var body: some View {
        textField()
    }

    @ViewBuilder func textField() -> some View {
        if isGrad {
            gradField()
        } else {
            regularField()
        }
    }
    
    func regularField() -> some View {
        TextField(placeholder, text: $text)
            .disabled(true)
            .multilineTextAlignment(.center)
            .fontWeight(.medium)
            .foregroundColor(.gray)
            .frame(height: 50)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.lightGray, lineWidth: 1))
    }
    
    func gradField() -> some View {
        TextField("", text: $text)
            .multilineTextAlignment(.center)
            .customPlaceholder(when: text.isEmpty) {
                HStack {
                    Spacer()
                    Text(placeholder)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            .fontWeight(.medium)
            .foregroundColor(.black)
            .frame(height: 50)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.linearGradient(.greenGrad, startPoint: .top, endPoint: .bottom), lineWidth: 1))
    }
}

extension View {
    func customPlaceholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder customPlaceholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            customPlaceholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
