//
//  Dictionary+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
  public func isEqual(to dict: Dictionary) -> Bool {
    guard count == dict.count else { return false }
    for (key, value) in self {
      if dict[key] != value {
        return false
      }
    }
    return true
  }
}
