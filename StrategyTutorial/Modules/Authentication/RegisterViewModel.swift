//
//  RegisterViewModel.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

final class RegisterViewModel: BaseViewModel {
    var email: Dynamic<String> = .init("")
    var password: Dynamic<String> = .init("")
    var confirmPassword: Dynamic<String> = .init("")
    
    func register() {
        do {
            try getRules().forEach { try $0.validate() }
            isLoading.value = true
        } catch let error {
            self.error.value = error.toLocalError()
        }
    }
    
    private func getRules() -> [ValidationRule] {
        [
            EmailValidationRule(email: email.value),
            PasswordValidationRule(
                password: password.value,
                isConfirmPassword: false
            ),
            PasswordValidationRule(
                password: confirmPassword.value,
                isConfirmPassword: true
            ),
            MatchingPasswordsValidationRule(
                password: password.value,
                repeatPassword: confirmPassword.value
            )
        ]
    }
}
