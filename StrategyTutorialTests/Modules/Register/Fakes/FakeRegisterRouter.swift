//
//  FakeRegisterRouter.swift
//  StrategyTutorialTests
//
//  Created by Ahmed Ramy on 21/12/2021.
//

@testable import StrategyTutorial

final class FakeRegisterRouter: RegisterRouterProtocol {
    var didGoToLogin: Bool = false
    
    func goToLogin() {
        didGoToLogin = true
    }
}
