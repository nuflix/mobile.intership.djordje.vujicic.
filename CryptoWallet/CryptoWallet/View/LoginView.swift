//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/17/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @EnvironmentObject var router: Router

    var body: some View {
        ZStack {
            LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.top)

            VStack {
                TitleTextComponentView(title: "Welcome Back!")
                Spacer()
                showImg()
                VStack {
                    stackView()

                    Spacer()

                    ButtonComponentView(text: "Login", tapGesture: viewModel.login)
                        .onReceive(viewModel.isLogged) { _ in
                            router.navigate(to: .loggedIn)
                        }
                    showLogin()
                }
                .frame(minHeight: 400)
                .background(.white)
                .cornerRadius(25, corners: [.topLeft, .topRight])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(repository: UserRepository()))
    }
}

private extension LoginView {
    func stackView() -> some View {
        return VStack {
            TextFieldComponentView(placeholder: "Email Address", text: $viewModel.email, disabled: false)
                .padding()
            PassFieldComponentView(placeholder: "Password", pass: $viewModel.pass)
                .padding()
        }
        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
    }

    @ViewBuilder func showImg() -> some View {
        if !viewModel.isVisible {
            Image("login")
        }
    }

    @ViewBuilder func showLogin() -> some View {
        if !viewModel.isVisible {
            HStack {
                Text("Don't have an account?")

                LinkTextComponentView(text: "Sign Up")
                    .onTapGesture {
                        router.navigate(to: .signup)
                    }
            }
            .padding(.bottom, 50)
        }
    }
}
