//
//  SplashScreenView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/28/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    @StateObject var viewModel: SplashScreenViewModel
    var body: some View {
        ZStack {
            display()
        }
        .onAppear() {
            viewModel.checkIfLogged()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
        }
      
    }
    
    @ViewBuilder func display() -> some View {
        if self.isActive {
            displayScreen()
        } else {
            displaySplash()
        }
    }
    
    
    @ViewBuilder func displaySplash() -> some View {
        ZStack {
            LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .center).ignoresSafeArea()
            VStack {
                Image("splashImage")
                Text("Welcome to")
                    .opacity(0.7)
                    .font(.custom("Roboto-Light", size: 28))
                    .foregroundColor(.white)
                Text("Wolly")
                    .font(.custom("Roboto-Light", size: 40))
                    .foregroundColor(.white)
            }
        }
    }
    
    
    @ViewBuilder func displayScreen() -> some View {
      
           LoginView(viewModel: LoginViewModel(repository: DIService.shared.userRepository))
            .fullScreenCover(isPresented: $viewModel.isLogged, content: LoggedInView.init)
        
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView(viewModel: SplashScreenViewModel(repository: DIService.shared.userRepository))
    }
}
