//
//  UserDefaults+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import Swifty

class UserDefaults_SwiftyTests: XCTestCase {
  let defaults = UserDefaults.standard

  func testInt() {
    defaults["int_key"] = 3
    XCTAssert(defaults["int_key"] == 3)
  }

  func testString() {
    defaults["string_key"] = "hello"
    XCTAssert(defaults["string_key"] == "hello")
  }

  func testBool() {
    defaults["bool_key"] = true
    XCTAssert(defaults["bool_key"] == true)
  }
}
