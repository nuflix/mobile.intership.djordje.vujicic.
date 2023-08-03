//
//  CreateAccountView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject var viewModel: CreateAccountViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        ZStack {
            LinearGradient(gradient: .blueGrad, startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.top)

            VStack {
                TitleTextComponentView(title: "Create Account")
                Spacer()
                showImage()

                VStack {
                    stackView()
                        .frame(minHeight: 290)
                    Spacer()

                    ButtonComponentView(text: "Create Account", tapGesture: viewModel.createAccount)
                        .onReceive(viewModel.isLogged) { _ in

                            router.navigate(to: .loggedIn)
                        }
                    showLogin()
                }
                .frame(minHeight: 350)
                .background(.white)
                .cornerRadius(25, corners: [.topLeft, .topRight])
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder func showImage() -> some View {
        if !viewModel.isVisible {
            Image("office")
        }
    }

    @ViewBuilder func showLogin() -> some View {
        if !viewModel.isVisible {
            HStack {
                Text("Already have an account?")
                LinkTextComponentView(text: "Login")
                    .onTapGesture {
                        router.navigateBack()
                    }
            }
            .padding(.bottom, 50)
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView(viewModel: CreateAccountViewModel(repository: UserRepository()))
    }
}

private extension CreateAccountView {
    func stackView() -> some View {
        return VStack {
            TextFieldComponentView(placeholder: "First Name", text: $viewModel.fName, disabled: false)
                .padding()
            TextFieldComponentView(placeholder: "Last Name", text: $viewModel.lName, disabled: false)
                .padding()
            TextFieldComponentView(placeholder: "Email Address", text: $viewModel.email, disabled: false)
                .padding()
            PassFieldComponentView(placeholder: "Password", pass: $viewModel.pass)
                .padding()
        }
        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
    }
}
