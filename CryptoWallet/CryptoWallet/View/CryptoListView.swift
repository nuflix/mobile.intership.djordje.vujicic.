//
//  CryptoListView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import SwiftUI

struct CryptoListView: View {
    var items: [CryptoListItemModel] = [CryptoListItemModel(id: 0, name: "ime", val: 10945.00), CryptoListItemModel(id: 1, name: "aaa", val: 1236.12), CryptoListItemModel(id: 2, name: "bb", val: 94.53)]
    var body: some View {

        NavigationView {
            VStack{
                Text("Add to your wallet").frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: LoginView(viewModel: LoginViewModel(repository: UserRepository()))) {
                            HStack {
                                Text("img")
                                VStack {
                                    Text(item.name)
                                    Text("\(item.val)$")
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        
    }
}

struct CryptoListView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoListView()
    }
}
