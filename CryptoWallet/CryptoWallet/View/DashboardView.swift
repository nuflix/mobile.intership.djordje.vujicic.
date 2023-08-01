//
//  DashboardView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/26/23.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var viewModel: DashboardViewModel
    

    
    var body: some View {
        NavigationView {
            VStack {
                board()
                    .padding(.horizontal, 35)
                    .padding(.vertical, 25)
                    .padding(.bottom, 20)
                listView()
            }
            .navigationBarTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.white)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .bottom), for: .navigationBar)
        }
        .navigationTitle("Dashboard")
            .onAppear {
                viewModel.fetchWallet()
            }
            .onDisappear {
                viewModel.tokens.removeAll()
            }
    }
    
    func board() -> some View {
        return VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("$\(String(viewModel.model.totalBalance))")
                        .font(.system(size: 26))
                        .bold()
                        .foregroundColor(.white)

                    Text("Your balance is equivalent")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
                .padding(.leading, 25)
                
                Spacer()
                
                Image("coin")
                    .padding(.trailing, 25)
                    .padding(.top, 3)
            }
            .padding(.top, 25)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(.linearGradient(.greenGrad, startPoint: .bottom, endPoint: .top))
        .cornerRadius(20)
    }
    
    func listView() -> some View {
        return List {
            ForEach(viewModel.model.cryptocurrencies) { item in
                NavigationLink(destination: TradingView(viewModel: TradingViewModel(repository: TradingRepository(), id: item.cryptocurrencyId, curVal: item.sum))) {
                    VStack { }
                        .padding(.vertical, 40)
                }
                .opacity(0.0)
                .overlay {
                    HStack() {
                        Image(base64String: item.icon)?
                            .resizable()
                            .frame(width: 40, height:  40)
                        
                        VStack(alignment: .leading) {
                            Text("\(item.abbreviation.uppercased())")
                                .fontWeight(.bold)
                            Text("$\(item.valueOfOne)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("$\(String(item.valueOfOne * item.sum))")
                                .fontWeight(.bold)
                            Text("\(item.sum) \(item.abbreviation.uppercased())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing)
                    }
                    
                }
            }
        }
        .listStyle(.plain)
    }
    
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(viewModel: DashboardViewModel(repository: DashboardRepository()))
    }
}
