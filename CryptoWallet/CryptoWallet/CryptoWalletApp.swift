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
                SplashScreenView(viewModel: SplashScreenViewModel(repository: DIService.shared.userRepository))
                    .navigationDestination(for: Router.Destination.self) { destination in
                                        switch destination {
                                        case .login:
                                            LoginView(viewModel: LoginViewModel(repository: DIService.shared.userRepository))
                                        case .signup:
                                            CreateAccountView(viewModel: CreateAccountViewModel(repository: DIService.shared.userRepository))
                                        case .loggedIn:
                                            LoggedInView()
                                        }
                                    }
            }
            .environmentObject(router)
        }
    }
}
