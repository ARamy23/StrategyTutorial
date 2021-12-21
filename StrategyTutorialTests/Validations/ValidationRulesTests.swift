//
//  ValidationRulesTests.swift
//  StrategyTutorialTests
//
//  Created by Ahmed Ramy on 20/11/2021.
//

import Nimble
import Quick
@testable import StrategyTutorial

/**
 * # What to test?
 * ## [X] Email
 * ## [X] Password
 * ## [X] Password & Confirm Password
 */
class ValidationRulesSpec: QuickSpec {
    override func spec() {
        describe("validating") {
            // MARK: - Email
            context("emails") {
                let field = Configurations.Validation.Field.email.title
                it("doesn't allow empty emails") {
                    // Arrange
                    let email = ""
                    let rule = EmailValidationRule(email: email)
                    let expectedError = LocalError(validation: ValidationError.empty(fieldName: rule.field.title)).text
                    do {
                        // Act
                        try rule.validate()
                    } catch {
                        // Assert
                        let actualError = error.toLocalError().text
                        print(actualError, expectedError)
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }

                it("doesn't allow invalid emails") {
                    let email = "..."
                    let rule = EmailValidationRule(email: email)
                    let expectedError = LocalError(validation: .invalid(fieldName: field)).text
                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.toLocalError().text
                        print(actualError, expectedError)
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }
            }

            // MARK: - Passwords
            context("password") {
                it("should not be empty") {
                    let password = ""
                    let rule = PasswordValidationRule(password: password)
                    let expectedError = LocalError(
                        validation: .empty(fieldName: rule.field.title)).text
                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.toLocalError().text
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }

                it("shoud be at least 5 characters") {
                    let password = "zz1z"
                    let rule = PasswordValidationRule(password: password)
                    let expectedError = LocalError(
                        validation: .tooShort(fieldName: rule.field.title, minimum: 5)
                    ).text
                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.toLocalError().text
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }

                it("should contain at least 1 number") {
                    let password = "zzzzz"
                    let rule = PasswordValidationRule(password: password)
                    let expectedError = LocalError(
                        validation: .passwordWeak(reason: .noNumbers)
                    ).text
                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.toLocalError().text
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }
            }
            
            context("password & confirm password") {
                it("should match when need confirmation") {
                    let password = "zzzzz1"
                    let confirmPassword = "zzzzz1z"
                    let rule = MatchingPasswordsValidationRule(password: password, repeatPassword: confirmPassword)
                    let expectedError = LocalError(
                        validation: .passwordMismatch
                    ).text

                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.toLocalError().text
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }
            }
        }
    }
}
