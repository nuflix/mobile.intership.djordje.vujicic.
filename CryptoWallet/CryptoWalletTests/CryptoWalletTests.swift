//
//  CryptoWalletTests.swift
//  CryptoWalletTests
//
//  Created by Administrator on 7/17/23.
//

import XCTest
import Combine
import Alamofire
import Realm
import RealmSwift
@testable import CryptoWallet

class MockUserInfo: UserInfoRepositoryInterface {
    
    var user = CurrentUser(currentCardBalance: 0.0, email: "", firstName: "", lastName: "")
    
    func getUser() -> AnyPublisher<CurrentUser, AFError> {
        return Just(user).setFailureType(to: AFError.self).eraseToAnyPublisher()
       
    }
    
    func addMoney(val: Double) -> AnyPublisher<EmptyModel, Error> {
        self.user = CurrentUser(currentCardBalance: user.currentCardBalance + val, email: "", firstName: "", lastName: "")
        return Just(EmptyModel())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    

}

class MockTrading : TradingRepositoryInterface {
    func buyCrypto(id: String, val: Double) -> AnyPublisher<EmptyModel, MyError> {
        return Just(EmptyModel())
            .setFailureType(to: MyError.self)
            .eraseToAnyPublisher()
    }
    
    func sellCrypto(id: String, val: Double) -> AnyPublisher<SuccessSell, MyError> {
        return Just(SuccessSell(message: "success"))
            .setFailureType(to: MyError.self)
            .eraseToAnyPublisher()
    }
    
    func update(ob: CryptocurrencyStorage) {
        /*let config = Realm.Configuration(
            schemaVersion: 2)
        // Use this configuration when opening realms
        Realm.Configuration.defaultConfiguration = config*/
        let realm = try! Realm()
      
        print(realm.objects(CryptocurrencyStorage.self))
        if let obj = realm.objects(CryptocurrencyStorage.self).where({ $0.id == ob.id }).first {
            try! realm.write {
                obj.valueOfOne = ob.valueOfOne
                obj.sum = ob.sum
            }
        } else {
            try! realm.write {
                realm.add(ob)
            }
        }
    }
    
    func fetchCryptoById(id: String) -> AnyPublisher<TradingModel, Alamofire.AFError> {
        return Just(TradingModel(id: "bitcoin", name: "bitcoin", icon: "", valueOfOne: 1.5, abbreviation: "BTC"))
            .setFailureType(to: AFError.self)
            .eraseToAnyPublisher()
    }
    
    
}


final class CryptoWalletTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    private var cancellables: Set<AnyCancellable> = []
    
    func testAddValue() {
        let expectation = XCTestExpectation(description: "value added")
        let mock = MockUserInfo()
        let sut = UserInfoViewModel(user: mock.user, repository: MockUserInfo())
        let val = "7"
        sut.$user.dropFirst().sink { (state: CurrentUser) in
            XCTAssertLessThan((abs(Double(val)! + sut.user.currentCardBalance) - state.currentCardBalance), 0.1)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.addMoney(val: val)
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testAddValueIntegration() {
        let expectation = XCTestExpectation(description: "value added")
        let mock = MockUserInfo()
        let sut = UserInfoViewModel(user: mock.user, repository: DIService.shared.userInfoRepository)
        let val = "7"
        sut.$user.dropFirst().sink { (state: CurrentUser) in
            XCTAssertLessThan((abs(Double(val)! + sut.user.currentCardBalance) - state.currentCardBalance), 0.1)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        sut.addMoney(val: val)

        wait(for: [expectation], timeout: 10)
    }
    
    func testTradingBuy() {
        let expectation = XCTestExpectation(description: "buying finished")
        let mock = MockTrading()
        let sut = TradingViewModel(repository: mock, id: "bitcoin")
        let oldVal = sut.curVal
        let val = 2.00
        
        
        sut.$curVal.dropFirst().sink { result in
            XCTAssertLessThan(abs((Double(result) ?? 70) - ((Double(oldVal) ?? 44)+val)), 0.1)
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        sut.buy(val: val)
        
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testTradingSell() {
        let expectation = XCTestExpectation(description: "selling finished")
        let mock = MockTrading()
        let sut = TradingViewModel(repository: mock, id: "bitcoin")
        let oldVal = sut.curVal
        let val = 20.00
        
        
        sut.$curVal.dropFirst().sink { (result: String) in
            print("\(oldVal) \(result)")
            XCTAssertLessThan(abs((Double(result) ?? 70) - ((Double(oldVal) ?? 44)-val)), 0.1)
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        sut.sell(val: val)
        
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testTradingSellIntegration() {
        let expectation = XCTestExpectation(description: "selling finished")
        let sut = TradingViewModel(repository: DIService.shared.tradingRepository, id: "bitcoin")
        let oldVal = sut.curVal
        let val = 1.00
        
        
        sut.$curVal.dropFirst().sink { (result: String) in
            print("\(oldVal) \(result)")
            XCTAssertLessThan(abs((Double(result) ?? 70) - ((Double(oldVal) ?? 44)-val)), 0.1)
            expectation.fulfill()
        }
        .store(in: &cancellables)
        
        sut.sell(val: val)
        
        
        wait(for: [expectation], timeout: 10)
    }
    

}
