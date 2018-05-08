//
//  String+SwiftyTest.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest

class StringSwiftyTest: XCTestCase {
  func testNS() {
    let hello = "hello"
    assert((hello as NSString) == hello.nsstr)
    assert(hello.nsstr.isKind(of: NSString.self))
  }

  func testString() {
    let hello: NSString = "hello"
    assert(hello.isKind(of: NSString.self))
    assert(type(of: hello.str) == String.self)
  }
}
