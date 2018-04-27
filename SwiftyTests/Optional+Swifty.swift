//
//  Optional+Swifty.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
@testable import Swifty

class OptionalSwifty: XCTestCase {
  func testOr() {
    let str: String? = nil
    assert(str.or("123") == "123")
    assert(str == nil)
  }

  func testOrEqualTo() {
    var str: String? = nil
    str = (str ?= "hello")
    assert(str == "hello")
  }
}
