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
    var isLogged: AnyPublisher<Void, Never> { isLoggedSubject.eraseToAnyPublisher() }
    private let isLoggedSubject = PassthroughSubject<Void, Never>()
    
    var errorReister: AnyPublisher<String, Never> { error.eraseToAnyPublisher() }
    private let error = PassthroughSubject<String, Never>()

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
        repository.createAccount(request: UserPostModel(email: email, firstName: fName, lastName: lName, password: pass)).sink { [weak self] completion in
            if case let .failure(err) = completion { self?.error.send(err.message)  }
        } receiveValue: { [weak self] _ in
            self?.login()
        }.store(in: &tokens)
    }

    func login() {
        repository.login(request: UserLoginModel(email: email, password: pass)).sink { [weak self] completion in
            if case let .failure(err) = completion { self?.error.send(err.message)  }
        } receiveValue: { [weak self] result in
            self?.isLoggedSubject.send()
            UserDefaultsController.saveJwt(jwt: result)
        }.store(in: &tokens)
    }
}
