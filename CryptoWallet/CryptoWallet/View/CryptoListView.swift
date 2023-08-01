//
//  CryptoListView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import SwiftUI

struct CryptoListView: View {
    @StateObject var viewModel: CryptoListViewModel
    
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Add to your wallet")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 30)
                    .foregroundColor(.gray)
                listView()
            }
            .navigationBarTitle("Crypto List")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.white)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(LinearGradient(gradient: .greenGrad, startPoint: .top, endPoint: .bottom), for: .navigationBar)
            
        }
        .onAppear() {
            viewModel.getCrypto()
        }
        
    }
    
    
    func listView() -> some View {
        return List {
            ForEach(viewModel.items) { item in
                NavigationLink(destination: TradingView(viewModel: TradingViewModel(repository: TradingRepository(), id: item.id, curVal: viewModel.findCrypto(id: item.id)?.sum ?? 0))) {
                    HStack {
                        Image(base64String: item.icon)?
                            .resizable()
                            .frame(width: 40, height:  40)
                        VStack(alignment: .leading) {
                            Text("\(item.name) (\(item.abbreviation.uppercased()))")
                                .fontWeight(.bold)
                            Text("\(item.valueOfOne)$")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
    
}


struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView(viewModel: CryptoListViewModel(repository: CryptoRepository()))
    }
}
