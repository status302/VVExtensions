//
//  Dispatch+SwiftyTest.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
@testable import Swifty

class DispatchSwiftyTest: XCTestCase {
  func testDelay() {
    let before = Date().timeIntervalSinceReferenceDate
    mainQueue.delay(1) {
      let now = Date().timeIntervalSinceReferenceDate
      assert(now - before >= 1)
    }
  }
}
