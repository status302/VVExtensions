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

  internal class var timerSelector: Selector {
    return #selector(WeakProxy.performTimerSelector(timer:))
  }
  internal class var displayLinkSelector: Selector {
    return #selector(WeakProxy.performDisplayLinkSelector(displayLink:))
  }

  public init(target: AnyObject, selector: Selector) {
    self.target = target
    self.selector = selector
  }

  @objc internal func performTimerSelector(timer: Timer) {
    _ = target?.perform(selector, with: timer)
  }

  @objc internal func performDisplayLinkSelector(displayLink: CADisplayLink) {
    _ = target?.perform(selector, with: displayLink)
  }
}
