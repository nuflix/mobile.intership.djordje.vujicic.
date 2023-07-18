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
            Text(text).bold().padding(.all).foregroundColor(.white)
        }.frame(minWidth: 200).background(.linearGradient(Gradient(colors: [Color(red: 74/255, green: 125/255, blue: 223/255), Color(red: 74/255, green: 214/255, blue: 223/255)]), startPoint: .top, endPoint: .bottom)).cornerRadius(25).padding(.all)
    }
}
