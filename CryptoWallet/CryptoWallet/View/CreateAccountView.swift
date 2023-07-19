//
//  CreateAccountView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    var stack: some View {
        VStack {
            TextFieldComponentView(placeholder: "First Name")
                .padding()
            TextFieldComponentView(placeholder: "Last Name")
                .padding()
            TextFieldComponentView(placeholder: "Email Address")
                .padding()
            PassFieldComponentView(placeholder: "Password")
                .padding()
        }
        .padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
    }
    
    var body: some View {
        ZStack {
           
            LinearGradient(gradient: .blueGrad, startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                
                TitleTextComponentView(title: "Create Account")
                Image("office")

                VStack {
                    stack
                    Spacer()
                        
                    ButtonComponentView(text:"Create Account")
                    HStack {
                        Text("Already have an account?")
                        LinkTextComponentView(text: "Login")
                    }
                    .padding(.bottom, 50)
                    
                }
                .background()
                .cornerRadius(25, corners: [.topLeft, .topRight])
                .frame(minHeight:550)
            }
            
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
