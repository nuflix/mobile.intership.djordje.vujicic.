//
//  Networker.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Foundation
import Alamofire
import Combine

class Networker {
    
    static let shared: Networker = {
        let configuration = URLSessionConfiguration.default
        //NetworkLogger.enableLogging(for: configuration)
        return Networker(configuration: configuration)
    }()
    
    private let session: Session
       
    private init(configuration: URLSessionConfiguration) {
        self.session = Session(configuration: configuration)
    }
    
    func fetch<T, U>(url: String, response: T, request: U) -> AnyPublisher<T, AFError>
    where T: Decodable, U:Encodable
    {
        return session.request(url, method: .post, parameters: request.self, encoder: JSONParameterEncoder.default).validate().publishDecodable(type: T.self).value().eraseToAnyPublisher()
    }
}
