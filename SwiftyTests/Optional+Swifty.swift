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
    XCTAssert(str.or("123") == "123")
    XCTAssert(str == nil)
  }

  func testIsNil() {
    var int: Int?
    XCTAssert(int.isNil)
    int = 1
    XCTAssert(int == 1)
    XCTAssert(!int.isNil)
  }

  func testArrayNil() {
    var arr: [String]?
    XCTAssert(arr.isNilOrEmpty)
    arr = ["hello"]
    XCTAssert(!arr.isNilOrEmpty)
  }

  func testApply() {
    var str: String?
    var notApply = false
    str.apply { _ in 
      notApply = true
    }
    XCTAssert(!notApply)

    str = "hello"
    str.apply { _ in
      notApply = true
    }
    XCTAssert(notApply)
  }
}
