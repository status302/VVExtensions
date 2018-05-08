//
//  Int+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

extension Int {

}


/// extension for DispatchTimeInterval
public extension Int {
  public var seconds: DelayInterval {
    return .init(seconds: self)
  }

  public var microseconds: DelayInterval {
    return .init(microseconds: self)
  }

  public var milliseconds: DelayInterval {
    return .init(milliseconds: self)
  }

  public var nanoseconds: DelayInterval {
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
