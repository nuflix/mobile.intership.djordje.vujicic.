//
//  Networker.swift
//  CryptoWallet
//
//  Created by Administrator on 7/20/23.
//

import Alamofire
import Combine
import Foundation

class Networker {
    static let shared: Networker = {
        let configuration = URLSessionConfiguration.default
        return Networker(configuration: configuration)
    }()

    private let session: Session
    private let baseUrl = "http://localhost:8080/api/v1"

    private init(configuration: URLSessionConfiguration) {
        session = Session(configuration: configuration)
    }

    func fetch<T, U>(url: String, request: U, method: HTTPMethod) -> AnyPublisher<T, AFError>
        where T: Decodable, U: Encodable {

        return session.request(baseUrl + url, method: method, parameters: request.self, encoder: JSONParameterEncoder.default, headers: .default).validate(statusCode: 200 ..< 300).publishDecodable(type: T.self).value().eraseToAnyPublisher()
    }

    func fetchWithoutReq<T>(url: String, method: HTTPMethod) -> AnyPublisher<T, AFError>
        where T: Decodable {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: UserDefaultsController.getJwt()),
        ]
        return session.request(baseUrl + url, method: method, headers: headers).validate(statusCode: 200 ..< 300).publishDecodable(type: T.self, emptyResponseCodes: [200]).value().eraseToAnyPublisher()
    }

    func fetchWithoutReqAndFail(url: String, method: HTTPMethod) -> AnyPublisher<Result<String, AFError>, Never>
    {
        let headers: HTTPHeaders = [
            .authorization(bearerToken: UserDefaultsController.getJwt()),
        ]
        return session.request(baseUrl + url, method: method, headers: headers).validate(statusCode: 200 ..< 300).publishDecodable(type: String.self, emptyResponseCodes: [200]).result().eraseToAnyPublisher()
    }
}
