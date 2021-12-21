//
//  RegisterBuilder.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

final class RegisterBuilder {
    func build() -> RegisterViewController {
        let vc = RegisterViewController()
        vc.viewModel = RegisterViewModel(
            router: RegisterRouter(currentView: vc)
        )
        return vc
    }
}
