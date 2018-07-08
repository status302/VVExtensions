//
//  CADisplayLink+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import QuartzCore.CADisplayLink

public extension CADisplayLink {
  public convenience init(proxy: WeakProxy) {
    self.init(target: proxy, selector: WeakProxy.displayLinkSelector)
  }
}
