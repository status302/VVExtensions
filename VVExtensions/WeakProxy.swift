//
//  WeakProxy.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public class WeakProxy {
  internal weak var target: AnyObject?
  internal let selector: Selector

  internal class var selector: Selector {
    return #selector(WeakProxy.performAction(action:))
  }

  public init(target: AnyObject, selector: Selector) {
    self.target = target
    self.selector = selector
  }

  @objc internal func performAction(action: NSObject) {
    _ = target?.perform(selector, with: action)
  }
}
