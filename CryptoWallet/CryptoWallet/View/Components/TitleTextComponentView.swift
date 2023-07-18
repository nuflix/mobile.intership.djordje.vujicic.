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
        Text(title).bold().foregroundColor(.white).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)).font(.system(size: 26))
    }
}

