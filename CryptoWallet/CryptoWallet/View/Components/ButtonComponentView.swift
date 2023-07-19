//
//  ButtonComponentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct ButtonComponentView: View {
    let text: String
    
    var body: some View {
        Button{
            
        } label:{
            Text(text)
                .bold()
                .padding()
                .foregroundColor(.white)
        }.frame(minWidth: 200)
            .background(.linearGradient(.greenGrad, startPoint: .top, endPoint: .bottom))
            .cornerRadius(25)
            .padding()
    }
}


