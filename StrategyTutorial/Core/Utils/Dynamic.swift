//
//  Dynamic.swift
//  StrategyTutorial
//
//  Created by Ahmed Ramy on 21/12/2021.
//

import Foundation

typealias Callback<T> = (T) -> ()

/// Lightweight Observable Pattern
public class Dynamic<T> {
  
  private var bindings: [Callback<T>] = []
  
  public var value: T {
    didSet {
      update()
    }
  }
  
  public init(_ v : T) {
    value = v
  }
  
  private func update() {
    bindings.forEach {
      $0(value)
    }
  }
  
  func subscribe(_ binding: @escaping Callback<T>) {
    self.bindings.append(binding)
  }
}
