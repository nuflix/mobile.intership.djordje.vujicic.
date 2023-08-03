//
//  LoggedInView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI

struct LoggedInView: View {
    @State var currentPage = curPage.dashboard

    var body: some View {
        TabView {
            DashboardView(viewModel: DashboardViewModel(repository: DIService.shared.dashboardRepository))
                .tabItem {
                    Label("", image: currentPage == curPage.dashboard ? dashboardIconSelected : dashboardIcon)
                }
                .onAppear {
                    currentPage = curPage.dashboard
                }

            CryptoListView(viewModel: CryptoListViewModel(repository: DIService.shared.cryptoRepository))
                .tabItem {
                    Label("", image: currentPage == curPage.cryptoList ? cryptoListIconSelected : cryptoListIcon)
                }
                .onAppear {
                    currentPage = curPage.cryptoList
                }

            UserView(text: "", cardText: "", viewModel: UserInfoViewModel(user: CurrentUser(currentCardBalance: 0, email: "", firstName: "", lastName: ""), repository: DIService.shared.userInfoRepository))
                .tabItem {
                    Label("", image: currentPage == curPage.userV ? userIconSelected : userIcon)
                }
                .onAppear {
                    currentPage = curPage.userV
                }

            SettingsView(viewModel: SettingsViewModel(repository: DIService.shared.userRepository))
                .tabItem {
                    Label("", image: currentPage == curPage.settingsV ? settingsIconSelected : settingsIcon)
                }
                .onAppear {
                    currentPage = curPage.settingsV
                }
        }
        .accentColor(.greenGrad)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
