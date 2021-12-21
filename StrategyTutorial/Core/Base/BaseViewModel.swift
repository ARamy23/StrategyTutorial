//
//  BaseViewModel.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

protocol ViewModelable {
    var isLoading: Dynamic<Bool> { get set }
    var successMessage: Dynamic<String> { get set }
    var error: Dynamic<LocalError?> { get set }
}

class BaseViewModel: ViewModelable {
    var isLoading: Dynamic<Bool> = .init(false)
    var successMessage: Dynamic<String> = .init("")
    var error: Dynamic<LocalError?> = .init(nil)
}
