//
//  Timer+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import class Foundation.NSTimer

public extension Timer {
  class func scheduledTimer(timerInterval ti: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats yesOrNo: Bool) -> Timer {
    return Timer.scheduledTimer(timeInterval: ti, target: proxy, selector: WeakProxy.selector, userInfo: userInfo, repeats: yesOrNo)
  }

  convenience init(timeInterval ti: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats yesOrNo: Bool) {
    self.init(timeInterval: ti, target: proxy, selector: WeakProxy.selector, userInfo: userInfo, repeats: yesOrNo)
  }

  convenience init(fireAt date: Date, interval: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats: Bool) {
    self.init(fireAt: date, interval: interval, target: proxy, selector: WeakProxy.selector, userInfo: userInfo, repeats: repeats)
  }
}

public typealias Block = () -> Void

internal class TimerAction {
  var block: Block

  internal init(block: @escaping Block) {
    self.block = block
  }

  @objc internal func fire() {
    block()
  }
}

public extension Timer {
  convenience init(fromNow ti: TimeInterval, block: @escaping Block) {
    let action = TimerAction(block: block)
    self.init(timeInterval: ti, target: action, selector: #selector(TimerAction.fire), userInfo: nil, repeats: false)
  }

  convenience init(every ti: TimeInterval, block: @escaping Block) {
    let action = TimerAction(block: block)
    self.init(timeInterval: ti, target: action, selector: #selector(TimerAction.fire), userInfo: nil, repeats: true)
  }

  class func schedule(fromNow ti: TimeInterval, block: @escaping Block) -> Timer {
    let action = TimerAction(block: block)
    return Timer.scheduledTimer(timeInterval: ti, target: action, selector: #selector(TimerAction.fire), userInfo: nil, repeats: false)
  }

  class func schedule(every ti: TimeInterval, block: @escaping Block) -> Timer {
    let action = TimerAction(block: block)
    return Timer.scheduledTimer(timeInterval: ti, target: action, selector: #selector(TimerAction.fire), userInfo: nil, repeats: true)
  }
}
