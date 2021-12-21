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
                        let actualError = error.asLocalError().text
                        print(actualError, expectedError)
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }

                it("doesn't allow invalid emails") {
                    let email = "..."
                    let rule = EmailValidationRule(email: email)
                    let expectedError = LocalError(validation: .emailInvalid).text
                    do {
                        try rule.validate()
                    } catch {
                        let actualError = error.asLocalError().text
                        print(actualError, expectedError)
                        expect(actualError).to(equal(expectedError), description: "\(actualError)-\(expectedError)")
                    }
                }
            }

            // MARK: - Passwords
            context("password") {}
        }
    }
}
