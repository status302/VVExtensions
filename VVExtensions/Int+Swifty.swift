//
//  Int+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

//TODO: - random range
public func random(range: Range<Int>) -> Int {
  return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
}

/// extension for DispatchTimeInterval
public extension Int {
  var seconds: DelayInterval {
    return .init(seconds: self)
  }

  var microseconds: DelayInterval {
    return .init(microseconds: self)
  }

  var milliseconds: DelayInterval {
    return .init(milliseconds: self)
  }

  var nanoseconds: DelayInterval {
    return .init(nanoseconds: self)
  }
}

public struct DelayInterval {
  private(set) var timeInterval: DispatchTimeInterval

  init(seconds: Int) {
    self.timeInterval = .seconds(seconds)
  }

  init(microseconds: Int) {
    self.timeInterval = .microseconds(microseconds)
  }

  init(nanoseconds: Int) {
    self.timeInterval = .nanoseconds(nanoseconds)
  }

  init(milliseconds: Int) {
    self.timeInterval = .milliseconds(milliseconds)
  }
}
