//
//  RegisterTests.swift
//  StrategyTutorialTests
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Quick
import Nimble
@testable import StrategyTutorial

/**
 * # What to test?
 * 1. Register Button is disabled until validations are filled
 * 2. Password Strength Hints works
 * 3. When Register pressed, UI State changes to loading first, then user navigates to Login
 */
class RegisterSpec: QuickSpec {
    override func spec() {
        describe("registeration") {
            context("fields validations") {
                it("must all be valid so user can press register") {
                    // Arrange
                    // Act
                    // Assert
                }
            }
            
            context("password strength") {
                it("must show user appropriate message upon failure in strength check") {
                    // Arrange
                    // Act
                    // Assert
                }
            }
            
            context("when register is pressed") {
                it("shows loading state") {
                    // Arrange
                    // Act
                    // Assert
                }
                
                it("goes to login") {
                    // Arrange
                    // Act
                    // Assert
                }
            }
        }
    }
}
