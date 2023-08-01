//
//  SettingsView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI
import Combine
var tokens: Set<AnyCancellable> = []
struct SettingsView: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                DashboardRepository().deleteData()

            }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
