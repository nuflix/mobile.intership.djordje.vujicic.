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
            let gradient = Gradient(colors: [Color(red: 74/255, green: 125/255, blue: 223/255), Color(red: 74/255, green: 214/255, blue: 223/255)])
            LinearGradient(gradient: gradient, startPoint: .top, endPoint: .center).edgesIgnoringSafeArea(.top)
            
            VStack {
                Spacer()
                TitleTextComponentView(title: "Welcome Back!")
                Spacer()
                Image("login")
                VStack {
                    VStack {
                        TextFieldComponentView(placeholder: "Email Address").padding(.all)
                        PassFieldComponentView(placeholder: "Password").padding(.all)
                    }.padding(EdgeInsets(top: 30, leading: 5, bottom: 0, trailing: 5))
                      Spacer()
                        
                    ButtonComponentView(text:"Login")
                    HStack {
                        Text("Don't have an account?")
                        LinkTextComponentView(text: "Sign Up")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                    
                }.background().cornerRadius(25, corners: [.topLeft, .topRight]).frame(minHeight:500)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}



