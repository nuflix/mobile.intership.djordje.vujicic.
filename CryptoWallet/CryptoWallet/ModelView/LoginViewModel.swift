import SwiftUI
import Alamofire
import Combine


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pass: String = ""
    
    private let repository: UserRepositoryInterface
    var tokens: Set<AnyCancellable> = []
    
    init(repository: UserRepositoryInterface) {
        self.repository = repository
    }
    
    func login() {
        repository.login(url: "http://localhost:8080/api/v1/users/login", request: UserLoginModel(email: email, password: pass)).sink { error in
            print("error: \(error)")
        } receiveValue: { result in
            
            UserDefaultsController.saveJwt(jwt: result)
            
            print(UserDefaultsController.getJwt() ?? "none")
        }.store(in: &tokens)
    }
    
}
