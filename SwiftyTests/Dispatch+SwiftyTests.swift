//
//  Dispatch+SwiftyTest.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
@testable import Swifty

class DispatchSwiftyTests: XCTestCase {
  func testDelayExcute() {
    let before = Date().timeIntervalSinceReferenceDate
    mainQueue.delay(1.seconds) {
      let now = Date().timeIntervalSinceReferenceDate
      XCTAssert(now - before >= 1)
    }
  }

  func testDelayItemExcute() {
    let before = Date().timeIntervalSinceReferenceDate
    mainQueue.delay(1.seconds, excute: DispatchWorkItem(block: {
      let now = Date().timeIntervalSinceReferenceDate
      XCTAssert(now - before >= 1)
    }))
  }

  class OnceClass {
    var count = 0
    var otherCount = 0

    func onceCountPlus() {
      mainQueue.once("OnceClassOnceCountPlus") {
        count += 1
      }
    }

    func mutableCountPlus() {
      otherCount += 1
    }
  }

  func testOnce() {
    let once = OnceClass()
    once.onceCountPlus()
    XCTAssert(once.count == 1)
    once.onceCountPlus()
    XCTAssert(once.count == 1)

    once.mutableCountPlus()
    XCTAssert(once.otherCount == 1)
    once.mutableCountPlus()
    XCTAssert(once.otherCount == 2)
    once.mutableCountPlus()
    XCTAssert(once.otherCount == 3)
  }

}
