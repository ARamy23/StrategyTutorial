//
//  Configurations.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

/// Represents Business Logic Configuration for easier changes whether global or specific changes
public enum Configurations {
    public enum Validation {}
}

public extension Configurations.Validation {
    enum Field {
        case email
        case password
        case confirmPassword

        var minMax: (min: Int, max: Int) {
            switch self {
            case .email:
                return (0, 999)
            case .password,
                 .confirmPassword:
                return (5, 32)
            }
        }

        var title: String {
            switch self {
            case .email:
                return "Email"
            case .password:
                return "Password"
            case .confirmPassword:
                return "Confirm Password"
            }
        }
    }
}
