//
//  LocalErrorParser.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

public struct LocalErrorParser {
    func parse(_ error: Error) -> LocalError {
        switch error {
        case let validationError as ValidationError:
            return .init(validation: validationError)
        default:
            return error as? LocalError ?? .init(text: error.localizedDescription)
        }
    }
}
