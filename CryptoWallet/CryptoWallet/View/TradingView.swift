//
//  TradingView.swift
//  CryptoWallet
//
//  Created by Administrator on 7/24/23.
//

import SwiftUI

struct TradingView: View {
    @StateObject var viewModel: TradingViewModel
    @State var tradeVal = "0 USD"
    @State var enterVal = "0.0"
    @State var activeBuy = true
    @State private var isPresentingConfirm: Bool = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack {
                header()
                    .padding(.top, 30)

                buySell()
                    .border(.black)

                Divider()
                    .padding(.bottom)

                textBoxArea()
                Spacer()
                ButtonComponentView(text: "Submit", tapGesture: showAlert)
                    .alert(isPresented: $isPresentingConfirm) {
                        Alert(
                            title: Text("Are you sure you want to \(activeBuy ? "buy" : "sell") \(enterVal) \(viewModel.model.abbreviation.uppercased()) for price of \(tradeVal)"),
                            primaryButton: .default(Text("Confirm")) {
                                activeBuy ? viewModel.buy(val: Double(enterVal) ?? 0.0) : viewModel.sell(val: Double(enterVal) ?? 0.0)
                            },
                            secondaryButton: .cancel()
                        )
                    }
            }
            .padding(.all, 20)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Trading")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.navbarColor, for: .navigationBar)
        .onAppear {
            viewModel.fetchModel()
        }
    }
    
    func showAlert() {
        isPresentingConfirm = true
    }

    func header() -> some View {
        VStack {
            Image(base64String: viewModel.model.icon)?
                .resizable()
                .frame(width: 150, height: 150)
            Text(String(format: "$%.2f", viewModel.model.valueOfOne))
                .font(.system(size: 18))
                .bold()
                .padding(.bottom, 1)
            Text("1.00 \(viewModel.model.abbreviation.uppercased())")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }

    func buySell() -> some View {
        HStack {
            BuySellBtnView(isActiveBuy: $activeBuy, text: "Buy")
        }
    }

    func textBoxArea() -> some View {
        VStack {
            Text("Current user value")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextFieldComponentView(placeholder: "", text: $viewModel.curVal, disabled: true)
                .padding(.bottom, 20)
            Text("Trade value")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextFieldComponentView(placeholder: "", text: $tradeVal, disabled: true)
                .padding(.bottom, 20)
            Text("Enter Trade value")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextFieldComponentView(placeholder: "", text: $enterVal, disabled: false)
                .onChange(of: enterVal) { _ in
                    updateVal(val: enterVal)
                }
        }
    }

    func updateVal(val: String) {
        tradeVal = String((Double(val) ?? 0) * viewModel.model.valueOfOne) + " USD"
    }
}

struct TradingView_Previews: PreviewProvider {
    static var previews: some View {
        TradingView(viewModel: TradingViewModel(repository: TradingRepository(), id: "bitcoin"))
    }
}
