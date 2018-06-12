//
//  Timer+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import class Foundation.NSTimer

public extension Timer {
  public class func scheduledTimer(timerInterval ti: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats yesOrNo: Bool) -> Timer {
    return Timer.scheduledTimer(timeInterval: ti, target: proxy, selector: WeakProxy.timerSelector, userInfo: userInfo, repeats: yesOrNo)
  }

  public convenience init(timeInterval ti: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats yesOrNo: Bool) {
    self.init(timeInterval: ti, target: proxy, selector: WeakProxy.timerSelector, userInfo: userInfo, repeats: yesOrNo)
  }

  convenience init(fireAt date: Date, interval: TimeInterval, proxy: WeakProxy, userInfo: Any?, repeats: Bool) {
    self.init(fireAt: date, interval: interval, target: proxy, selector: WeakProxy.timerSelector, userInfo: userInfo, repeats: repeats)
  }
}
