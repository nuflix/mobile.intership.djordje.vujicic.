//
//  UserView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI

struct UserView: View {
    @State var text: String
    @State var cardText: String
    @State private var isPresentingConfirm: Bool = false
    @StateObject var viewModel: UserInfoViewModel
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    UserInfoTextBoxView(placeholder: "\(viewModel.user.firstName) \(viewModel.user.lastName)", text: $text, isGrad: false)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 30)
                    UserInfoTextBoxView(placeholder: viewModel.user.email, text: $text, isGrad: false)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 30)
                    UserInfoTextBoxView(placeholder: String(viewModel.user.currentCardBalance), text: $text, isGrad: false)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 30)
                    Divider()
                    UserInfoTextBoxView(placeholder: "Add to credit card", text: $cardText, isGrad: true)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 30)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
                Spacer()
                ButtonComponentView(text: "Submit", tapGesture: showALert)
                    .padding(.bottom, 20)
                    .alert(isPresented: $isPresentingConfirm) {
                        Alert(
                            title: Text("Are you sure you want to logout?"),
                            primaryButton: .default(Text("Confirm")) {
                                viewModel.addMoney(val: cardText)
                            },
                            secondaryButton: .cancel()
                        )
                    }
            }
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("User Info")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.navbarColor, for: .navigationBar)
        }
        .onAppear {
            viewModel.getUser()
        }
    }
    
    
    func showALert() {
        isPresentingConfirm = true
    }
    
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(text: "", cardText: "", viewModel: UserInfoViewModel(user: CurrentUser(currentCardBalance: 0, email: "", firstName: "", lastName: ""), repository: DIService.shared.userInfoRepository))
    }
}
