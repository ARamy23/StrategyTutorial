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
    
    var validationsError: Dynamic<[
        Configurations.Validation.Field: LocalError?
    ]> = .init([
        .email: nil,
        .password: nil,
        .confirmPassword: nil
    ])
    
    private let router: RegisterRouterProtocol
    
    init(router: RegisterRouterProtocol) {
        self.router = router
    }
    
    func register() {
        validate()
    }
    
    private func validate() {
        do {
            try EmailValidationRule(email: email.value).validate()
            validationsError.value[.email] = nil
        } catch let error {
            validationsError.value[.email] = error.toLocalError()
        }
        
        do {
            try PasswordValidationRule(
                password: password.value,
                isConfirmPassword: false
            ).validate()
            validationsError.value[.password] = nil
        } catch let error {
            validationsError.value[.password] = error.toLocalError()
        }
        
        do {
            try PasswordValidationRule(
                password: confirmPassword.value,
                isConfirmPassword: true
            ).validate()
            validationsError.value[.confirmPassword] = nil
        } catch let error {
            validationsError.value[.confirmPassword] = error.toLocalError()
        }
        
        do {
            try MatchingPasswordsValidationRule(
                password: password.value,
                repeatPassword: confirmPassword.value
            ).validate()
            validationsError.value[.password] = nil
            validationsError.value[.confirmPassword] = nil
        } catch let error {
            validationsError.value[.password] = error.toLocalError()
            validationsError.value[.confirmPassword] = error.toLocalError()
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
