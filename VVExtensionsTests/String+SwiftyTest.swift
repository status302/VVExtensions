//
//  String+SwiftyTest.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import VVExtensions

class StringSwiftyTest: XCTestCase {
  func testNS() {
    let hello = "hello"
    XCTAssert((hello as NSString) == hello.nsstr)
    XCTAssert(hello.nsstr.isKind(of: NSString.self))
  }

  func testString() {
    let hello: NSString = "hello"
    XCTAssert(hello.isKind(of: NSString.self))
    XCTAssert(type(of: hello.str) == String.self)
  }

  func testRandomPassword() {
    let password = String.randomPassword(length: 5)
    XCTAssertEqual(password.count, 5)
  }
}
