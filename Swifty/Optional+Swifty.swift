//
//  Optional+Swifty.swift
//  Swifty
//
//  Created by vsccw on 2018/4/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension Optional {

  public func or(_ value: Wrapped) -> Wrapped {
    if let ret = self {
      return ret
    } else {
      return value
    }
  }

  public var isNil: Bool {
    switch self {
    case .none: return true
    case .some: return false
    }
  }

  public func apply(_ function: (Wrapped) -> Void) {
    self.map(function)
  }
}

public extension Optional where Wrapped: Collection {
  public var isNilOrEmpty: Bool {
    switch self {
    case .none:            return true
    case .some(let value): return value.isEmpty
    }
  }
}

public extension Optional where Wrapped: StringProtocol {
  public var isNilOrEmpty: Bool {
    switch self {
    case .none:            return true
    case .some(let value): return value.isEmpty
    }
  }
}

public extension Optional where Wrapped == String {
  public var orEmpty: String {
    return self.or("")
  }
}
