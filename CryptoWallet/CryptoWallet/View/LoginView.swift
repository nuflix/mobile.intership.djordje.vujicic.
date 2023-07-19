//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/17/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.top)

            VStack {
                TitleTextComponentView(title: "Welcome Back!")
                Image("login")
                VStack {
                    self.stackView()

                    Spacer()

                    ButtonComponentView(text: "Login")
                    HStack {
                        Text("Don't have an account?")
                        LinkTextComponentView(text: "Sign Up")
                    }
                    .padding(.bottom, 50)
                }
                .background()
                .cornerRadius(25, corners: [.topLeft, .topRight])
                .frame(minHeight: 500)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

private extension LoginView {
    func stackView() -> some View {
        return VStack {
            TextFieldComponentView(placeholder: "Email Address")
                .padding()
            PassFieldComponentView(placeholder: "Password")
                .padding()
        }
        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
    }
}
