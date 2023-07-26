//
//  ContentView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/17/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.top)
                
                VStack {
                    TitleTextComponentView(title: "Welcome Back!")
                    showImg()
                    VStack {
                        stackView()
                        
                        Spacer()
                        NavigationLink(destination: CryptoListView(viewModel: CryptoListViewModel(repository: CryptoRepository()))) {
                            Text("Crypto List")
                        }
                        ButtonComponentView(text: "Login")
                            .onTapGesture {
                                viewModel.login()
                            }
                        HStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: CreateAccountView(viewModel: CreateAccountViewModel(repository: UserRepository()))){
                                LinkTextComponentView(text: "Sign Up")
                            }
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
}
