//
//  SettingsView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import Combine
import SwiftUI
var tokens: Set<AnyCancellable> = []
struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var shouldDismiss = false
    @State private var isPresentingConfirm = false
    
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ButtonLogoutComponentView(text: "Logout", tapGesture: showAlert)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .alert(isPresented: $isPresentingConfirm) {
                        Alert(
                            title: Text("Are you sure you want to logout?"),
                            primaryButton: .default(Text("Confirm")) {
                                viewModel.logout()
                                shouldDismiss = true
                            },
                            secondaryButton: .cancel()
                        )
                    }
                Spacer()
            }
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Settings")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.navbarColor, for: .navigationBar)
        }
        .onChange(of: shouldDismiss) { newValue in
            if newValue {
                dismiss()
            }
        }
    }
    
    func showAlert() {
        isPresentingConfirm = true
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(repository: UserRepository()))
    }
}
