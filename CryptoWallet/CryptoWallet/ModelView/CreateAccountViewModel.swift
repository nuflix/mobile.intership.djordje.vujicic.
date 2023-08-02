//
import Alamofire
import Combine
//  createAccountPost.swift
//  CryptoWallet
import SwiftUI

class CreateAccountViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var fName: String = ""
    @Published var lName: String = ""
    @Published var isVisible = false
    @Published var isLogged: Bool = false

    private let repository: UserRepositoryInterface
    var tokens: Set<AnyCancellable> = []

    init(repository: UserRepositoryInterface) {
        self.repository = repository
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        isVisible = true
    }

    @objc func keyboardWillHide(notification: Notification) {
        isVisible = false
    }

    func createAccount() {
        repository.createAccount(request: UserPostModel(email: email, firstName: fName, lastName: lName, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] _ in

            UserDefaultsController.saveUser(user: UserModel(email: self?.email ?? "", fName: self?.fName ?? "", lName: self?.lName ?? ""))
            self?.login()
            // repository.login()
            print(UserDefaultsController.getUser() ?? "none")
        }.store(in: &tokens)
    }

    func login() {
        repository.login(request: UserLoginModel(email: email, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] result in
            self?.isLogged.toggle()
            UserDefaultsController.saveJwt(jwt: result)
            print(UserDefaultsController.getJwt() ?? "none")
        }.store(in: &tokens)
    }
}
