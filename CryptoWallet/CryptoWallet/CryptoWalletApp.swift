//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Administrator on 7/17/23.
//

import SwiftUI

@main
struct CryptoWalletApp: App {
    
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashScreenView(viewModel: SplashScreenViewModel(repository: UserRepository()))
                    .navigationDestination(for: Router.Destination.self) { destination in
                                        switch destination {
                                        case .login:
                                            LoginView(viewModel: LoginViewModel(repository: UserRepository()))
                                        case .signup:
                                            CreateAccountView(viewModel: CreateAccountViewModel(repository: UserRepository()))
                                        case .loggedIn:
                                            LoggedInView()
                                        }
                                    }
            }
            .environmentObject(router)
        }
    }
}
