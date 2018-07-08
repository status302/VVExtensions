//
//  Any+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public var mainQueue: DispatchQueue {
  return DispatchQueue.main
}

public var globalQueue: DispatchQueue {
  return DispatchQueue.global()
}

public extension DispatchQueue {
  public func delay(_ duration: DelayInterval, execute: @escaping () -> Void) {
    asyncAfter(deadline: .now() + duration.timeInterval, execute: execute)
  }

  public func delay(_ duration: DelayInterval, excute: DispatchWorkItem) {
    asyncAfter(deadline: .now() + duration.timeInterval, execute: excute)
  }

  public func once(_ label: String, execute: () -> Void) {
    objc_sync_enter(self)
    defer { objc_sync_exit(self) }
    guard !Tracker.contains(label) else { return }
    Tracker.append(label)
    execute()
  }
}

struct Tracker {
  private static var onces: [String] = []

  fileprivate static func append(_ label: String) {
    onces.append(label)
  }

  fileprivate static func contains(_ label: String) -> Bool {
    return onces.contains(label)
  }
}
