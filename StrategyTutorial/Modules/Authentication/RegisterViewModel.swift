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
        let rules: [ValidationRule] = [
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
        
        do {
            try rules.forEach { try $0.validate() }
        } catch let error {
            self.error.value = error.toLocalError()
        }
    }
}
