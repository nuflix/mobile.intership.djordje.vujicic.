//
//  UserDefaultsController.swift
//  CryptoWallet
//
//  Created by Administrator on 7/21/23.
//

import Foundation

class UserDefaultsController {
    public static func saveUser(user: UserModel) {
        UserDefaults.standard.set(user, forKey: "user")
    }

    public static func saveJwt(jwt: JwtModel) {
        UserDefaults.standard.set(jwt.jwtToken, forKey: "jwt")
        print(getJwt())
    }

    public static func getUser() -> UserModel? {
        return UserDefaults.standard.object(forKey: "user") as? UserModel ?? UserModel(email: "", fName: "", lName: "")
    }

    public static func getJwt() -> String {
        return UserDefaults.standard.string(forKey: "jwt") ?? ""
    }

    public static func deleteUser() {
        UserDefaults.standard.setValue("", forKey: "jwt")
        UserDefaults.standard.removeObject(forKey: "user")
    }
}
