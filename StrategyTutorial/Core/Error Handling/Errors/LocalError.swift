//
//  LocalError.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

public struct LocalError: Error, Codable, Equatable {
    var text: String

    init(text: String) {
        self.text = text
    }

    init(validation: ValidationError) {
        text = validation.localizedDescription
    }

    public static func == (lhs: LocalError, rhs: LocalError) -> Bool {
        lhs.text == rhs.text
    }
}

extension Error {
    func toLocalError() -> LocalError {
        LocalErrorParser().parse(self)
    }
}
