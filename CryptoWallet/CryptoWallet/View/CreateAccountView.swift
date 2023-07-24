//
//  CreateAccountView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject var viewModel: CreateAccountViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: .blueGrad, startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.top)
                
                VStack {
                    TitleTextComponentView(title: "Create Account")
                    Image("office")
                    
                    VStack {
                        stackView()
                        Spacer()
                        
                        ButtonComponentView(text: "Create Account")
                            .onTapGesture {
                                viewModel.createAccount()
                            }
                        HStack {
                            Text("Already have an account?")
                            LinkTextComponentView(text: "Login")
                                .onTapGesture {
                                dismiss()
                            }
                        }
                        .padding(.bottom, 50)
                    }
                    .background()
                    .cornerRadius(25, corners: [.topLeft, .topRight])
                    .frame(minHeight: 550)
                }
            }
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
            TextFieldComponentView(placeholder: "First Name", text: $viewModel.fName)
                .padding()
            TextFieldComponentView(placeholder: "Last Name", text: $viewModel.lName)
                .padding()
            TextFieldComponentView(placeholder: "Email Address", text:$viewModel.email)
                .padding()
            PassFieldComponentView(placeholder: "Password", pass: $viewModel.pass)
                .padding()
        }
        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
    }
}
