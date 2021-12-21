//
//  RegisterRouter.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

protocol RegisterRouterProtocol {
    func goToLogin()
}

final class RegisterRouter: RegisterRouterProtocol {
    
    private let currentView: BaseViewController
    
    init(currentView: BaseViewController) {
        self.currentView = currentView
    }
    
    func goToLogin() {
//        currentView.push(LoginViewController())
    }
}
