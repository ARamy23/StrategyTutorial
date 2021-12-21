//
//  ValidationRule.swift
//  SQ10
//
//  Created by Ahmed Ramy on 18/10/2021.
//

import Foundation

public protocol ValidationRule {
    var value: String { get set }
    func validate() throws
}

public protocol IsMandatory {
    var field: Configurations.Validation.Field { get }
    func validateIsEmpty() throws
}

public protocol HasMinimum {
    var field: Configurations.Validation.Field { get }
    func validateMinimum() throws
}

public protocol HasMaximum {
    var field: Configurations.Validation.Field { get }
    func validateMaximum() throws
}

public extension HasMinimum where Self: ValidationRule {
    func validateMinimum() throws {
        guard value.count >= field.minMax.min else {
            throw ValidationError
                .tooShort(
                    fieldName: field.title,
                    minimum: field.minMax.min
                )
        }
    }
}

public extension HasMaximum where Self: ValidationRule {
    func validateMaximum() throws {
        guard value.count <= field.minMax.max else {
            throw ValidationError.tooLong(
                fieldName: field.title,
                maximum: field.minMax.max
            )
        }
    }
}

public extension IsMandatory where Self: ValidationRule {
    func validateIsEmpty() throws {
        guard value.isEmpty == false else {
            throw ValidationError.empty(
                fieldName: field.title
            )
        }
    }
}

public typealias PasswordStrengthCheck = ((String) throws -> Void)

public protocol PasswordStrengthValidator: AnyObject {
    var checks: [PasswordStrengthCheck] { get }

    func validateStrength() throws
}

public extension PasswordStrengthValidator where Self: ValidationRule {
    func validateStrength() throws {
        try checks.forEach { try $0(self.value) }
    }
}
