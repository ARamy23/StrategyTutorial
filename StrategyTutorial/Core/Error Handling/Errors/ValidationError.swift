//
//  ValidationError.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

public enum ValidationError {
    // MARK: - Authentication Validations

    case tooShort(fieldName: String, minimum: Int)
    case tooLong(fieldName: String, maximum: Int)

    case tooShortWithoutMinimum(fieldName: String)
    case tooLongWithoutMaximum(fieldName: String)
    case empty(fieldName: String)
    case invalid(fieldName: String)

    case containOnly(FieldRequirement, String)
    case mustContain(FieldRequirement, String)
    case cantContain(FieldRequirement, String)

    case passwordWeak(reason: PasswordWeaknessReason)
    case passwordMismatch
}

public enum PasswordWeaknessReason {
    case noNumbers

    var errorDescription: String {
        switch self {
        case .noNumbers:
            return "No Numbers"
        }
    }
}

public enum FieldRequirement: String {
    case letters
    case numbers
    case symbols
    case whiteSpaces = "white spaces"
}

extension ValidationError: Error, LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .empty(fieldName):
            return "\(fieldName) can't be empty."
        case .passwordMismatch:
            return "Passwords are not matching."
        case let .passwordWeak(reason):
            return reason.errorDescription
        case let .tooShort(fieldName, minimum):
            return "\(fieldName) can't be shorter than \(minimum)"
        case let .tooLong(fieldName, maximum):
            return "\(fieldName) can't be longer than \(maximum)"
        case let .containOnly(requirement, fieldName):
            return "\(fieldName) can only contain \(requirement)"
        case let .cantContain(requirement, fieldName):
            return "\(fieldName) cant contain \(requirement)"
        case let .mustContain(requirement, fieldName):
            return "\(fieldName) must contain \(requirement)"
        case let .tooShortWithoutMinimum(fieldName):
            return "\(fieldName) is too short."
        case let .tooLongWithoutMaximum(fieldName):
            return "\(fieldName) is too long."
        case let .invalid(fieldName):
            return "\(fieldName) is invalid."
        }
    }
}
