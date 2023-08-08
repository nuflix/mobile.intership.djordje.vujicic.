//
//  Errors.swift
//  CryptoWallet
//
//  Created by Administrator on 8/8/23.
//

import Foundation
import Alamofire

enum MyErrorPicker {
    case login
    case register
    case buy
    case sell
}

struct MyError: Error {
    let message: String
}

extension AFError {
    func message(_ err: MyErrorPicker) -> MyError {
        
        if self.responseCode == 400 {
            switch err {
            case .login:
                return MyError(message: "Wrong email or password")
            case .register:
                return MyError(message: "Invalid data or email already exists")
            case .buy:
                return MyError(message: "Something went wrong! You might not have enough money on your card")
            case .sell:
                return MyError(message: "Something went wrong! You might not have enough coins")
            }
        }
        
        return MyError(message: "Oops! Something went wrong! Please try again later.")
    }
}
