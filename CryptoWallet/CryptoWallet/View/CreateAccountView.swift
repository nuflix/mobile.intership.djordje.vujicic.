//
//  CreateAccountView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/18/23.
//

import SwiftUI

struct CreateAccountView: View {
    var body: some View {
        ZStack {
            let gradient = Gradient(colors: [Color(red: 74/255, green: 125/255, blue: 223/255, opacity: 1), Color(red: 74/255, green: 214/255, blue: 223/255, opacity: 0.2)])
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .center).edgesIgnoringSafeArea(.top)
            
            VStack {
                Spacer()
                TitleTextComponentView(title: "Create Account")
                Spacer()
                Image("office")
                

                VStack {
                    VStack {
                        TextFieldComponentView(placeholder: "First Name").padding(.all)
                        TextFieldComponentView(placeholder: "Last Name").padding(.all)
                        TextFieldComponentView(placeholder: "Email Address").padding(.all)
                        PassFieldComponentView(placeholder: "Password").padding(.all)
                    }.padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
                      Spacer()
                        
                    ButtonComponentView(text:"Create Account")
                    HStack {
                        Text("Already have an account?")
                        LinkTextComponentView(text: "Login")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    
                }.background().cornerRadius(25, corners: [.topLeft, .topRight]).frame(minHeight:550)
            }
            
        }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
