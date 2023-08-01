//
//  EmptyModel.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Foundation
import Alamofire

struct EmptyModel: EmptyResponse, Codable {
    static func emptyValue() -> EmptyModel {
        return EmptyModel()
    }
    
    
}

