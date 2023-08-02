import SwiftUI
import Alamofire
import Combine


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var isVisible: Bool = false
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

    @objc func login() {
        repository.login(request: UserLoginModel(email: email, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { [weak self] result in
            UserDefaultsController.saveJwt(jwt: result)
            self?.isLogged.toggle()
        }.store(in: &tokens)
    }
    
}
