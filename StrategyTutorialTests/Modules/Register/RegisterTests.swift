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
            var viewModel: RegisterViewModel!
            var fakeRouter: FakeRegisterRouter!
            
            beforeEach {
                fakeRouter = FakeRegisterRouter()
                viewModel = RegisterViewModel(router: fakeRouter)
            }

            afterEach {
                viewModel = nil
                fakeRouter = nil
            }
            
            context("fields validations") {
                it("must all be valid so user can press register") {
                    // Arrange
                    viewModel.email.value = "dev.ahmedramy@gmail.com"
                    viewModel.password.value = "123456AR"
                    viewModel.confirmPassword.value = "123456AR"
                    
                    // Act
                    viewModel.register()
                    
                    // Assert
                    expect(viewModel.error.value).to(beNil())
                }
            }
            
            context("password strength") {
                it("must show user appropriate message upon failure in strength check") {
                    // Arrange
                    viewModel.email.value = "dev.ahmedramy@gmail.com"
                    viewModel.password.value = "ARARARARAR"
                    viewModel.confirmPassword.value = "ARARARARAR"
                    
                    // Act
                    viewModel.register()
                    
                    // Assert
                    expect(
                        viewModel.error.value
                    ).to(
                        equal(
                            ValidationError.passwordWeak(reason: .noNumbers).toLocalError()
                        )
                    )
                }
            }
            
            context("when register is pressed") {
                it("shows loading state") {
                    // Arrange
                    viewModel.email.value = "dev.ahmedramy@gmail.com"
                    viewModel.password.value = "123456AR"
                    viewModel.confirmPassword.value = "123456AR"
                    
                    // Act
                    viewModel.register()
                    
                    // Assert
                    expect(viewModel.isLoading.value).to(beTrue())
                }
                
                it("goes to login") {
                    // Arrange
                    viewModel.email.value = "dev.ahmedramy@gmail.com"
                    viewModel.password.value = "123456AR"
                    viewModel.confirmPassword.value = "123456AR"
                    
                    // Act
                    viewModel.register()
                    
                    // Assert
                    expect(fakeRouter.didGoToLogin).toEventually(beTrue())
                }
            }
        }
    }
}
