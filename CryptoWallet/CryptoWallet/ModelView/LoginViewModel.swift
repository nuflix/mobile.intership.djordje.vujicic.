import SwiftUI
import Alamofire
import Combine


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var isVisible: Bool = false
    
    private let repository: UserRepositoryInterface
    var tokens: Set<AnyCancellable> = []
    
    init(repository: UserRepositoryInterface) {
        self.repository = repository
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        isVisible = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc func keyboardWillHide(notification: Notification) {
        isVisible = false
    }

    func login() {
        repository.login(request: UserLoginModel(email: email, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { result in
            
            UserDefaultsController.saveJwt(jwt: result)
            print(UserDefaultsController.getJwt() ?? "none")
        }.store(in: &tokens)
    }
    
}
