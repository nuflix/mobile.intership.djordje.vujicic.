//
//  UserDefaultsController.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import Foundation

class UserDefaultsController {
    public static func saveUser(user: UserModel) {
        UserDefaults.standard.set(user.email, forKey: "email")
        UserDefaults.standard.set(user.fName, forKey: "fName")
        UserDefaults.standard.set(user.lName, forKey: "lName")
    }
    
    public static func saveJwt(jwt: JwtModel) {
        UserDefaults.standard.set(jwt.jwtToken, forKey: "jwt")
    }
    
    public static func getUser() -> UserModel? {
        return UserModel(email: UserDefaults.standard.string(forKey: "email") ?? "", fName: UserDefaults.standard.string(forKey: "fName") ?? "", lName: UserDefaults.standard.string(forKey: "lName") ?? "")
    }
    
    public static func getJwt() -> String? {
        return UserDefaults.standard.string(forKey: "jwt") ?? nil
    }
}
