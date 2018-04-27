//
//  Optional+Swifty.swift
//  Swifty
//
//  Created by vsccw on 2018/4/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

infix operator ?= : AssignmentPrecedence

public extension Optional {

  public func or(_ value: Wrapped) -> Wrapped {
    return self ?? value
  }

  public static func ?= (lhs: Optional, rhs: Wrapped) -> Wrapped {
    guard let value = lhs else { return rhs }
    return value
  }
}
