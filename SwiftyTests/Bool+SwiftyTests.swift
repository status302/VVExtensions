//
//  Bool+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/5/22.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest

class Bool_SwiftyTests: XCTestCase {
  func testToggle() {
    let value = true
    XCTAssert(value.toggle == false)
  }

  func testSetToggle() {
    var value = false
    value.setToggle()
    XCTAssert(value == true)
  }
}
