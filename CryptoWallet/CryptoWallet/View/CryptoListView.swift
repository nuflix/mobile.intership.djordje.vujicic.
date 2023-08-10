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
            VStack {
                Text("Add to your wallet")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top, 30)
                    .foregroundColor(.gray)
                listView()
            }
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Crypto List")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.navbarColor, for: .navigationBar)
        }
        .onAppear {
            viewModel.getCrypto()
        }
    }

    @ViewBuilder func listView() -> some View {
        if(viewModel.fetched) {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink(destination: TradingView(viewModel: TradingViewModel(repository: DIService.shared.tradingRepository, id: item.id, curVal: viewModel.findCrypto(id: item.id)?.sum ?? 0))) {
                        HStack {
                            Image(base64String: item.icon)?
                                .resizable()
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading) {
                                Text("\(item.name) (\(item.abbreviation.uppercased()))")
                                    .fontWeight(.bold)
                                Text(String(format: "$%.2f", item.valueOfOne))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading)
                        }
                        .padding(.vertical, 15)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { dimension in
                        dimension[.leading]
                    }
                }
            }
            .listStyle(.plain)
            .padding(.trailing, 20)
        } else {
            List {
                ShimmerEffectBox()
                    .frame(height: 60)
                ShimmerEffectBox()
                    .frame(height: 60)
                ShimmerEffectBox()
                    .frame(height: 60)
                ShimmerEffectBox()
                    .frame(height: 60)
            }
            .listStyle(.plain)
            .padding(.trailing, 20)
        }
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView(viewModel: CryptoListViewModel(repository: DIService.shared.cryptoRepository))
    }
}
