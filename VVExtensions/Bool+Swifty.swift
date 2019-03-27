//
//  Bool+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/22.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension Bool {
  var toggle: Bool {
    return !self
  }

  @discardableResult
  mutating func setToggle() -> Bool {
    self = !self
    return self
  }
}
