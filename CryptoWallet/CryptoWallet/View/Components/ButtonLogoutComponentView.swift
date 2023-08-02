//
//  ButtonLogoutComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 8/1/23.
//

import SwiftUI

struct ButtonLogoutComponentView: View {
    let text: String
    let tapGesture: () -> Void

    init(text: String, tapGesture: @escaping () -> Void) {
        self.text = text
        self.tapGesture = tapGesture
    }
    
    var body: some View {
        Button {
            tapGesture()
        } label: {
            Text(text)
                .bold()
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: 500)
                .background(.linearGradient(.greenGrad, startPoint: .top, endPoint: .bottom))
                .cornerRadius(15)
                .shadow(color: .gray, radius: 3, x: 0, y: 5)
                .padding()
        }
     
    }
}
