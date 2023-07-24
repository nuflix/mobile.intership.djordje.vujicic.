//
//  createAccountPost.swift
//  CryptoWallet
import SwiftUI
import Alamofire
import Combine


class CreateAccountViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var fName: String = ""
    @Published var lName: String = ""
    
    private let repository: UserRepositoryInterface
    var tokens: Set<AnyCancellable> = []
    
    init(repository: UserRepositoryInterface) {
        self.repository = repository
    }
    
    func createAccount() {
        repository.createAccount(url: "http://localhost:8080/api/v1/users/register", request: UserPostModel(email: email, firstName: fName, lastName: lName, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { result in
            
            UserDefaultsController.saveUser(user: UserModel(email: self.email, fName: self.fName, lName: self.lName))
                
                //repository.login()

            print(UserDefaultsController.getUser() ?? "none")
        }.store(in: &tokens)    
    }

    
}
